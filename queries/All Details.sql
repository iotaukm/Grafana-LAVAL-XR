-- Select specific columns for better readability and processing.
SELECT 
  time AS Time,                     -- Timestamp of the record.
  identifier AS Identifier,         -- Unique identifier for the metric.
  connectionID AS conID,            -- Connection ID (shortened alias for clarity).
  measure_value::varchar AS Measure, -- Cast the measure value to string (varchar).
  measure_value::double AS Duration -- Cast the measure value to double for numeric operations.
FROM 
  areht.session_metric              -- Table containing session metrics.
WHERE 
  measure_name IN ('SessionStatus', 'PauseDuration') -- Filters for specific measure names.
  AND appName = '${appName}'                         -- Application name placeholder for filtering.
  AND organizationID = '${organizationID}'           -- Organization ID placeholder for filtering.
  AND scene = '${scene}'                             -- Scene placeholder for filtering.
  AND customerID IN (${customerID})                  -- Allows filtering for multiple customer IDs.
  AND connectionID IN (${connectionID});             -- Allows filtering for multiple connection IDs.
