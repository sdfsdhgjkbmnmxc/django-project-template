$(function() {
    $('.file-upload a').each(function() {
        this.innerHTML = '<div><img src="' + this.href + '" /></div>'
    });
});
