use rand::seq::SliceRandom;
use serde::Deserialize;
use shellexpand::tilde;
use std::{collections::HashMap, fs};

#[derive(Deserialize, Debug)]
pub struct UserConfig {
    transitions: Option<Vec<String>>,
    schedule: Option<HashMap<String, Vec<String>>>,
}

impl UserConfig {
    pub fn from_config_dir() -> Self {
        let config_path = dirs::config_dir()
            .unwrap()
            .join("wall-scheduler")
            .join("config.toml");
        let config = fs::read_to_string(config_path).unwrap();
        let config: UserConfig = toml::from_str(&config).unwrap();
        config
    }
}

#[derive(Debug)]
pub struct Config {
    transitions: Vec<String>,
    map: HashMap<u32, Vec<String>>,
}

impl Config {
    pub fn get_transition(&self) -> Option<String> {
        if self.transitions.is_empty() {
            return None;
        }
        let random_transition = self.transitions.choose(&mut rand::thread_rng());
        if let Some(transition) = random_transition {
            return Some(transition.to_string());
        }

        None
    }

    pub fn get_wallpaper(&self, hour: u32) -> Option<String> {
        if self.map.is_empty() {
            return None;
        }

        let mut map: Vec<(u32, &Vec<String>)> = self.map.iter().map(|(k, v)| (*k, v)).collect();
        map.sort_by(|a, b| b.0.cmp(&a.0)); // descending

        // try to find the most recent past wallpaper
        for (key, value) in &map {
            if hour >= *key {
                return value.choose(&mut rand::thread_rng()).cloned();
            }
        }

        let (_, value) = map.first()?; // map is sorted descending, so first is latest
        value.choose(&mut rand::thread_rng()).cloned()
    }
}

impl From<UserConfig> for Config {
    fn from(value: UserConfig) -> Self {
        let transitions = value.transitions.unwrap_or(vec!["wipe".to_string()]);
        let schedule = value.schedule.unwrap();
        let map: HashMap<u32, Vec<String>> = schedule
            .into_iter()
            .map(|(key, wallpapers)| {
                (
                    key.parse().unwrap(),
                    wallpapers
                        .iter()
                        .map(|val| tilde(val).to_string())
                        .collect(),
                )
            })
            .collect();
        Self { transitions, map }
    }
}
