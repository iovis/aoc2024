use day01::*;

fn main() {
    divan::main();
}

#[divan::bench]
fn part1() {
    let input = include_str!("../input.txt");
    p1::run(divan::black_box(input)).unwrap();
}

#[divan::bench]
fn part2() {
    let input = include_str!("../input.txt");
    p2::run(divan::black_box(input)).unwrap();
}
