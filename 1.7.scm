(load "test-manager/load.scm")
(load "sqrt.scm")
(define (new-sqrt-iter guess last-guess x)
  (if (new-good-enough? guess last-guess x)
    guess
    (new-sqrt-iter (improve guess x)
               guess
               x)))

(define (new-good-enough? guess last-guess x)
  (< (abs (- guess last-guess)) (/ guess 10000)))

(define (new-square-root x)
  (new-sqrt-iter 1.0 1.1 x))

  (in-test-group
    change-in-guess-approximation

    (define-test (large)
      (check (= (new-square-root 1000000000000) 1000000)))

    (define-test (small)
      (check (= (new-square-root 0.000000000000099) 0.000000314642654))))

  (run-registered-tests)
