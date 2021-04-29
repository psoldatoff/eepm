#!/usr/bin/env bats
has_space()
{
  /usr/share/eepm/tools_estrlist has_space "$@"
}

ok()
{
  has_space "$@" && errors="Texting $* FAILED: space(s) not detected"
}

notok()
{
  has_space "$@" || errors="Texting $* FAILED: space(s) not detected"
}

@test "smallfuncs" {
  notok "list"
  ok "l i s t"
  ok "li st"
  ok " l i s t "
  ok " l "
  ok "  "
  ok " "
  notok ""
  [ -n "$errors" ]
}
