(use rfc.tls)
(use rfc.http)
(use gauche.process)

(define (http-get-test)
  (print "tls-ca-bundle-path=" (tls-ca-bundle-path))
  (guard (ex [else (print ex)])
    (receive (status header-list body)
        (http-get "www.microsoft.com" "/" :secure #t)
      (print "http status=" status))))

(print)
(print "== HTTP TEST ==")
(print)

(http-get-test)
(print)

(tls-ca-bundle-path 'system)
(http-get-test)
(print)

(tls-ca-bundle-path #"~(process-output->string \"which openssl\")/cert.pem")
(http-get-test)
(print)

