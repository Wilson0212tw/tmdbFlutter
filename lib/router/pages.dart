enum Pages {
  home('home'),
  login('login'),
  find('find');

  final String key;

  const Pages(this.key);
}  





// class PageConfiguration {
//   final String key;
//   final String path;
//   final Pages uiPage;
//   PageAction currentPageAction;

//   PageConfiguration(
//       {@required this.key, @required this.path, @required this.uiPage, this.currentPageAction});
// }