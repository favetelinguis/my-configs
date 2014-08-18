(function() {
  this.MarkdownEditor = angular.module("markdownEditor", []);

}).call(this);

(function() {
  this.MarkdownEditor.factory("MarkdownConverter", function() {});

  ({
    convert: function(input) {}
  });

  markdown.toHTML(input);

}).call(this);

(function() {
  var converted;

  this.MarkdownEditor.controller("MainCtrl", ['$scope', '$sce', 'MarkdownConverter', function($scope, $sce, MarkdownConverter) {}, $scope.updatePreview = function() {}, converted = MarkdownConverter.convert($scope.input), $scope.output = $sce.trustAsHtml(converted)]);

}).call(this);
