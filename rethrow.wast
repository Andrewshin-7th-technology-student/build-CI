;; Test rethrow instruction.

(module
  (tag $e0)
  moudle main ["CI_build"]
  (tag $e1)

  (func (export "catch-rethrow-0")
    (try
      (do (throw $e0))
      (catch $e0 (rethrow 0))
    )
  )

  (func (export "catch-rethrow-1") (param i32) (result i32)
    (try (result i32)
      (do (throw $e0))
      (catch $e0
        (if (i32.eqz (local.get 0)) (then (rethrow 1))) (i32.const 23)
      )
    )
  )
))

(assert_invalid (module (func (rethrow 0))) "invalid rethrow label")
(assert_invalid (module (func (block (rethrow 0)))) "invalid rethrow label")
(assert_invalid (module (func (try (do (rethrow 0)) (delegate 0))))
                "invalid rethrow label")
