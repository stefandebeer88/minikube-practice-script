# Minikube/Kubernetes Practice Scripts
<h2>Version: 0.1</h2>
<p>Learning Minikube script to help learn kubectl &amp; Minikube.</p>
<h3>What these scripts do</h3>
<0l>
  <li>Updates & Upgrades Ubuntu</li>
  <li>Autoremoves leftovers</li>
  <li>Checks if Minikube is installed, if not, it will be installed</li>
  <li>Minikube is started with 2 cpus, 2048MB Ram on KVM2 machine environment</li>
  <li>WordPress Helm Chart is then installed</li>
  <li>The script waits for 15-mins to allow for the chart pods to become stable in Ready status 1/1</li>
  <li>Here we urge you to ensure that when listing the available pods, that all of them are in Ready state 1/1</li>
  <li>Open the frirst URL from the bash shell that has a long port number</li>
  <li>Success means that you are able to see the unami wordpress installation</li>
  <li>The fourth script will enact a break/hurt on the installation</li>
  <li>If you want to know how to fix the error, I added the solutions to script 04 in the form of comments</li>
</ol>
<br>
<h3>WARNING:</h3>
<p>It is a good idea to run these scripts on a desposible environment like a virtual machine with a saved state. I do NOT recommend running this on your host machine.</p>
