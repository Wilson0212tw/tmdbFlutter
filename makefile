genCode:
		flutter pub run build_runner build --delete-conflicting-outputs

buildWeb:
		flutter build web

buildWeb_canvas:
		flutter build web  --web-renderer canvaskit

buildWeb_html:
		flutter build web  --web-renderer html