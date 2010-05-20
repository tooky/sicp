(load "test-manager/load.scm")

(define (root-iter improve guess last-guess x)
  (if (good-enough? guess last-guess x)
    guess
    (root-iter improve
               (improve guess x)
               guess
               x)))

(define (cube-improve guess x)
  (/
    (+ (/ x (square guess))
       (* 2 guess))
    3))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess last-guess x)
  (< (abs (- guess last-guess)) (/ guess 100000)))

(define (cube-root x)
  (root-iter cube-improve 1.0 1.1 x))

(define (sqrt x)
  (root-iter sqrt-improve 1.0 1.1 x))

  (in-test-group
    change-in-guess-approximation

    (define-test (very-simple-cube)
      (check (= (cube-root 8) 2)))

    (define-test (very-simple-square)
      (check (= (sqrt 4) 2)))

    (define-test (simple-cube)
      (check (= (cube-root 64) 4)))

    (define-test (simple-square)
      (check (= (sqrt 16) 4))))

  (run-registered-tests)
