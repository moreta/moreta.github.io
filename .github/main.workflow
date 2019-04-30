workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Slack"]
}

action "HTTP client" {
  uses = "swinton/httpie.action@02571a073b9aaf33930a18e697278d589a8051c1"
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@5faabb4216b20af98fe77b6d9048d24becfefd31"
  needs = ["HTTP client"]
}
