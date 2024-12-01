use day01::p1;
use miette::Context;

#[tracing::instrument]
fn main() -> miette::Result<()> {
    tracing_subscriber::fmt::init();

    let input = include_str!("../../input.txt");

    println!("p1 = {:?}", p1::run(input).context("part 1")?);

    Ok(())
}
