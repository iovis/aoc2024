#[tracing::instrument]
pub fn run(input: &str) -> miette::Result<usize> {
    let mut left: Vec<usize> = vec![];
    let mut right: Vec<usize> = vec![];

    for line in input.lines() {
        let (l, r) = line.split_once("   ").unwrap();
        left.push(l.parse::<usize>().unwrap());
        right.push(r.parse::<usize>().unwrap());
    }

    left.sort_unstable();
    right.sort_unstable();

    let mut sum = 0;

    for i in 0..left.len() {
        sum += (left[i]).abs_diff(right[i]);
    }

    Ok(sum)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn p1_test() -> miette::Result<()> {
        let input = indoc::indoc! {"
            3   4
            4   3
            2   5
            1   3
            3   9
            3   3
        "};

        assert_eq!(run(input)?, 11);

        Ok(())
    }
}
