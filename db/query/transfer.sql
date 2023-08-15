-- name: CreateTransfer :one
INSERT INTO transfers (
  from_account_id,
  to_account_id,
  ammount
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetTransfer :one
SELECT * FROM transfers
WHERE id = $1 LIMIT 1;

-- name: ListTranfers :many
SELECT * FROM transfers
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateTranfer :one
UPDATE transfers
SET from_account_id = $2, to_account_id = $3, ammount = $4
WHERE id = $1
RETURNING *;

-- name: DeleteTranfer :exec
DELETE FROM transfers
WHERE id = $1;
