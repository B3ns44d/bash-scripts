import subprocess

pr_list = subprocess.check_output(["gh", "pr", "list"]).decode("utf-8")
pr_numbers = pr_list.split("\n")
pr_numbers = [pr_number.split("\t")[0] for pr_number in pr_numbers]
for pr_number in pr_numbers:
    if pr_number:
        subprocess.check_output(["gh", "pr", "review", "-a", pr_number])
        print("Approved PR #" + pr_number)
