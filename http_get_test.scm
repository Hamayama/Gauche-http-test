(use rfc.tls)
(print "tls-ca-bundle-path=" (tls-ca-bundle-path))

(use rfc.http)
(receive (status header-list body)
    (http-get "www.microsoft.com" "/" :secure #t)
  (print "http status=" status))
