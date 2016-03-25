fn main() {
    let out_dir = std::env::var("OUT_DIR").unwrap();
    let out_dir_escaped = str::replace(&out_dir, " ", "\\ ");
    //std::env::set_var("OUT_DIR", out_dir_escaped.clone());
    //println!("{}", out_dir_escaped);

    if !std::process::Command::new("make")
        .status().unwrap().success() {
        panic!("Script failed {}", std::env::var("OUT_DIR").unwrap());
    }
    //println!("cargo:rustc-flags=-L {}", "/Users/Seanlth/Documents/College\ Notes/4.Fourth\ Year/Thesis/Implementation/Fluids/target/debug/build/lodepng-ef39d10ab505b188/out");
    println!("cargo:rustc-link-search=native={}", out_dir);

}
