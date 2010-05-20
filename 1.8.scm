(load "test-manager/load.scm")

(define (cube-root-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
    guess
    (cube-root-iter (improve guess x)
                    guess
                    x)))

(define (improve guess x)
  (/
    (+ (/ x (square guess))
       (* 2 guess))
    3))

(define (good-enough? guess last-guess x)
  (< (abs (- guess last-guess)) (/ guess 100)))

(define (cube-root x)
  (cube-root-iter 1.0 1.1 x))

  (in-test-group
    change-in-guess-approximation

    (define-test (very-simple)
      (check (= (cube-root 8) 2)))

    (define-test (simple)
      (check (= (cube-root 64) 4))))

  (run-registered-tests)
