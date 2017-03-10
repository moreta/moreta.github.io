


# ios7 separator inset(table border?)

## コードで設定

ios7で separatorの左部分に空白が入っているこれを修正するには以下の方法を利用

`[tableView setSeparatorInset:UIEdgeInsetsZero];`

or

`[tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];`


旧versionも対応するためには `responseToSelector`を利用

```
if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
    [tableView setSeparatorInset:UIEdgeInsetsZero];
}
```

## storyboardで設定
*table view cell*

![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-03-14/tableviewcell.gif)

*table view*

![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-03-14/tableview.png)


# row insert

<http://d.hatena.ne.jp/SOTOCHA/20130213/1360750214>



`insertRowsAtIndexPaths:withRowAnimation:`

このメソッドを実行すると第一引数で指定したNSIndexPathのインスタンスを引数に

`tableView:cellForRowAtIndexPath`

が実行されます。

つまり、

indexPathで指定した箇所のみのセルのみ

`tableView:cellForRowAtIndexPath`メソッドで再描写されます。

そして同時に
`tableView:numberOfRowsInSection:`

`numberOfSectionsInTableView`

の返り値に整合性を持たせなければなりません。

でないと`insertRowsAtIndexPaths:withRowAnimation`でエラーが出てしまいます。

# static cell

## static cell の event

<http://stackoverflow.com/questions/9703541/fire-a-method-from-a-static-cell-in-a-table-view-controller>


```
@property (nonatomic, weak) IBOutlet UITableViewCell *theStaticCell;
Connect that outlet to the cell in the storyboard.

Now in tableView:didSelectRowAtIndexPath method:

UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
if (theCellClicked == theStaticCell) {
    //Do stuff
}
```

# deselect

<http://stackoverflow.com/questions/3968037/how-to-deselect-a-selected-uitableview-cell>

```
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
    //Change the selected background view of the cell.
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
 }
```


# pull to refresh

## ios6

<http://www.lextech.com/2012/10/ios-6-pull-to-refresh-tutorial/>



## ios6以前

<https://github.com/enormego/EGOTableViewPullRefresh>


# create tableview programmatically

* <http://stackoverflow.com/questions/15846707/creating-a-uitableview-programmatically>

# libraries

+ [DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)
  + tableviewでデータがないとき何か表示に便利
