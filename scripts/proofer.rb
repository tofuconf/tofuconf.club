require "html-proofer"

HTMLProofer.check_directory("./_site", {
    enforce_https: false,
    ignore_status_codes: [400,999],
    ignore_urls: [
        /#.*/,
        /tofuconf.club\/.*/,
        /twitter.com/,
        /t.co/,
        /www.facebook.com\/sharer\/sharer.php.*/,
        /www.kyash.co/
    ]
}).run
