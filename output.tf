output "vpcranid" {
  value = random_string.random.result

}

output "vpcname" {
  value = aws_vpc.test1
}