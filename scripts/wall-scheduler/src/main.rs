mod config;
use std::process::Command;

use chrono::{Local, Timelike};
use config::{Config, UserConfig};

fn main() {
    let user_config = UserConfig::from_config_dir();
    let config: Config = user_config.into();

    let now = Local::now();
    let now = now.hour();
    let mut args: Vec<String> = vec!["img".to_string()];
    let current_wallpaper = config.get_wallpaper(now).unwrap();
    args.push(current_wallpaper);
    let transition = config.get_transition();
    if let Some(transition) = transition {
        args.push("--transition-type".to_string());
        args.push(transition)
    }

    let output = Command::new("swww").args(args).output().unwrap();
    println!("{:?}", output)
}
