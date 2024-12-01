use {{crate_name}}::p2;
use miette::Context;

#[tracing::instrument]
fn main() -> miette::Result<()> {
    tracing_subscriber::fmt::init();

    let input = include_str!("../../input.txt");

    println!("p2 = {:?}", p2::run(input).context("part 2")?);

    Ok(())
}
