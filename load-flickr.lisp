(use-package '(:automatr :flickr :clickr))

(defvar *api-key* "fe62be41f5e31734214d3efd4312dbb6")
(defvar *shared-secret* "357a7ea29d65120d")

(defvar *my-user-name* "schani")
(defvar *my-user* nil)

(defun login-and-make-actions ()
  (let ((api-info (request-authorization *api-key* *shared-secret*)))
    (sleep 10)
    (complete-authorization api-info)
    (let* ((*me* (user-with-name api-info *my-user-name*))
	   (actions (audit-actions (all-applicable-actions *me*))))
      (htmlize-actions actions)
      (setf *my-user* *me*)
      actions)))
