{application, sellaprime,
 [{description, "The Prime Number Shop"},
  {vsn, "1.0"},
  {modules, [sellaprime_app, sellaprime_supervisor, area_server]},
  {applications, [kernel, stdlib]},
  {mod, {sellaprime_app, []}},
  {start_phases, []}
 ]}.
