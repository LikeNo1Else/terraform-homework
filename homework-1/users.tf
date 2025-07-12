# First batch of users
resource "aws_iam_user" "user1" {
  name = "jenny"
}
resource "aws_iam_user" "user2" {
  name = "rose"
}
resource "aws_iam_user" "user3" {
  name = "lisa"
}
resource "aws_iam_user" "user4" {
  name = "jisoo"
}

# Second batch of users
resource "aws_iam_user" "user5" {
  name = "jihyo"
}
resource "aws_iam_user" "user6" {
  name = "sana"
}
resource "aws_iam_user" "user7" {
  name = "momo"
}
resource "aws_iam_user" "user8" {
  name = "dahyun"
}

# Create groups
resource "aws_iam_group" "group1" {
  name = "blackpink"
}
resource "aws_iam_group" "group2" {
  name = "twice"
}

# Add users to groups
resource "aws_iam_group_membership" "team1" {
  name = "add-user-to-group1"
  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
    aws_iam_user.user9.name,
  ]
  group = aws_iam_group.group1.name
}
resource "aws_iam_group_membership" "team2" {
  name = "add-user-to-group2"
  users = [
    aws_iam_user.user5.name,
    aws_iam_user.user6.name,
    aws_iam_user.user7.name,
    aws_iam_user.user8.name,
    aws_iam_user.user10.name,
  ]
  group = aws_iam_group.group2.name
}

# To add new manually created users to terraform run commands:
# terraform import aws_iam_user.user9 miyeon
# terraform import aws_iam_user.user10 mina

# Add resource so terrafrom be able to proper add new users to group and delete them:
resource "aws_iam_user" "user9" {
  name = "miyeon"
}
resource "aws_iam_user" "user10" {
  name = "mina"
}