#[tracing::instrument]
pub fn run(input: &str) -> miette::Result<usize> {
    todo!("p1::run");

    Ok(8)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn p1_test() -> miette::Result<()> {
        let input = indoc::indoc! {"

        "};

        assert_eq!(run(input)?, 8);

        Ok(())
    }
}
