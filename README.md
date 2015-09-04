# EntWP-cookbook

GDPHAR-841  Create Varnish Layer cookbook for Wordpress
GDPHAR-896	Spin up Varnish Layer cookbook in scalr in sandbox

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['EntWP']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### EntWP::default

Include `EntWP` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[EntWP::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
