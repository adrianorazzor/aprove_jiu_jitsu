$files = @(
    "lib/aprove_jiu_jitsu_web/controllers/donations_controller.ex",
    "lib/aprove_jiu_jitsu_web/controllers/contact_html.ex",
    "lib/aprove_jiu_jitsu_web/controllers/contact_controller.ex",
    "lib/aprove_jiu_jitsu_web/controllers/competitions_html.ex",
    "lib/aprove_jiu_jitsu_web/controllers/competitions_controller.ex",
    "lib/aprove_jiu_jitsu_web/controllers/classes_html.ex",
    "lib/aprove_jiu_jitsu_web/controllers/classes_controller.ex",
    "lib/aprove_jiu_jitsu_web/controllers/blog_html.ex",
    "lib/aprove_jiu_jitsu_web/controllers/blog_controller.ex",
    "lib/aprove_jiu_jitsu_web/controllers/about_html.ex",
    "lib/aprove_jiu_jitsu_web/controllers/about_controller.ex"
)

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file)
    $content = $content.Replace("`r`n", "`n")
    [System.IO.File]::WriteAllText($file, $content)
    Write-Host "Fixed line endings in $file"
}

Write-Host "Line endings fixed for all files. Run 'mix credo' again to verify." 