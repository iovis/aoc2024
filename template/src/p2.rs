#[tracing::instrument]
pub fn run(input: &str) -> miette::Result<usize> {
    todo!("p2::run");

    Ok(8)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn p2_test() -> miette::Result<()> {
        let input = indoc::indoc! {"

        "};

        assert_eq!(run(input)?, 8);

        Ok(())
    }
}
