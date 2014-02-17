chub-hornetq Cookbook
=====================
Install HornetQ on Linux hosts


Requirements
------------
Ubuntu Linux >= 12.04
Java 7
Tomcat 7


Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### chub-hornetq::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chub-hornetq']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>


Usage
-----
#### chub-hornetq::buyspace
Add `chub-hornetq::buyspace` to your node's `run_list`

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chub-hornetq]"
  ]
}
```

#### chub-hornetq::default
Installs PreReqs


Contributing
------------

e.g.
1. Fork the repository
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github


License and Authors
-------------------
Authors: 

* H. "Waldo" Grunenwald
