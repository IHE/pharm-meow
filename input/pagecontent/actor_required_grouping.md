This section describes required and recommended actor groupings for the IHE Medication Overview (MEOW) Profile. This content is preliminary and will be completed in a future version.

An actor from this profile (Column 1) shall be grouped with the corresponding actors listed in Column 2.

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<thead>
<tr class="odd" style='background: gray;'>
<th>MEOW Actor</th>
<th>Grouped Actor</th>
<th>Reference</th>
</tr>
</thead>
<tbody>
<tr class="even">
<td>Medication Overview Repository</td>
<td>ATNA Secure Node or Secure Application; IUA Authorization Server / Resource Server (as applicable)</td>
<td>Security and audit (see <a href="security_considerations.html">Security Considerations</a>)</td>
</tr>
<tr class="odd">
<td>Medication Overview Consumer</td>
<td>ATNA Secure Node or Secure Application; IUA Authorization Client (as applicable)</td>
<td>Security and audit (see <a href="security_considerations.html">Security Considerations</a>)</td>
</tr>
<tr class="even">
<td>Medication Overview Creator</td>
<td>ATNA Secure Node or Secure Application</td>
<td>Security and audit (see <a href="security_considerations.html">Security Considerations</a>)</td>
</tr>
</tbody>
</table>

The grouping with MPD actors is described in [Cross Profile Considerations](cross_profile_considerations.html).
