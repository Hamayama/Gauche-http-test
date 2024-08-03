(use rfc.http)
(receive (status header-list body)
    (http-get "www.microsoft.com" "/" :secure #t)
  (print status))
