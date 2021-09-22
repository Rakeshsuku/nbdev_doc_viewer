# nbdev_doc_viewer

nbdev_doc_viewer creates a docker container to view the documentation for any repository built using [fast.ai](https://www.fast.ai/)'s [nbdev](https://nbdev.fast.ai/) template.

---

To configure nbdev_doc_viewer to display the documentation for your repository update the value of _REPO_ variable in **.env** file with the path to your repository and run:

```docker-compose up --build -d```

Now, you can view the documentation for your repository at
http://localhost:4000/${REPO}/

Replace _REPO_ in the above url with your repository name.

---

Run the below command to pull down the documentation site (-v removes any named volumes):

``` docker-compose down -v ```

***