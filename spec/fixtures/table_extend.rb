def table_extend_str
  <<-eohtml
<body>
<table id='example-table'>
  <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th data-override="Score">Points</th></tr>
  </thead>
  <tbody>
    <tr>
      <td>Jill</td>
      <td>Smith</td>
      <td data-override="disqualified">50</td></tr>
    <tr>
      <td>Eve</td>
      <td>Jackson</td>
      <td>94</td></tr>
    <tr>
      <td>John</td>
      <td>Doe</td>
      <td>80</td></tr>
    <tr>
      <td>Adam</td>
      <td>Johnson</td>
      <td>67</td></tr>
  </tbody>
</table>
<table>
</table>
</body>
  eohtml
end

def no_td_table
  <<-eohtml
<table id='example-table'>
  <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th data-override="Score">Points</th></tr>
  </thead>
</table>
  eohtml
end

def no_tr_table
  <<-eohtml
<table id='example-table'>
</table>
  eohtml
end

def no_th_table
  <<-eohtml
<table id='example-table'>
  <tbody>
    <tr>
      <td>Jill</td>
      <td>Smith</td>
      <td data-override="disqualified">50</td></tr>
    <tr>
      <td>Eve</td>
      <td>Jackson</td>
      <td>94</td></tr>
    <tr>
      <td>John</td>
      <td>Doe</td>
      <td>80</td></tr>
    <tr>
      <td>Adam</td>
      <td>Johnson</td>
      <td>67</td></tr>
  </tbody>
</table>
  eohtml
end

