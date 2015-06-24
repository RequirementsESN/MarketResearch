# MarketResearch

<h2 id="step-one install-rv">Step One  Install RVM</h2>

<hr>

<p>We will be installing RVM from the project's website, so we will not be relying on Debian's default repositories for the actual installation.</p>

<p>However, RVM uses the package manager to install dependencies for the programs it manages, so we should make sure those repositories are up-to-date:</p>
<pre class="code-pre "><code langs="">sudo apt-get update
</code></pre>
<p>Next, we will install RVM, Ruby, and Rails in a single command.  This assumes that you want a single-user installation, which will be applicable in most cases.  Do this as a regular user, not as root:</p>
<pre class="code-pre "><code langs="">\curl -L https://get.rvm.io | bash -s stable --rails
</code></pre>
<p>This will take awhile to finish.  When complete, you will have a stable Ruby instance and the Rails framework installed.</p>

<p>Once the process is complete, we need to make our environment aware of the new RVM installation.  This will happen automatically when we open new terminal windows from now on:</p>
<pre class="code-pre "><code langs="">source ~/.rvm/scripts/rvm
</code></pre>
<h2 id="step-two get-ruby-environment-information">Step Two  Get Ruby Environment Information</h2>

<hr>

<p>You can easily get info from RVM about what Ruby version is being used currently and what the file paths are for related applications and services.</p>

<p>Run the info command to get these details:</p>
<pre class="code-pre "><code langs="">rvm info
</code></pre>
<hr>
<pre class="code-pre "><code langs="">ruby-2.0.0-p247:

  system:
    uname:       "Linux RVM 3.2.0-4-amd64 #1 SMP Debian 3.2.41-2+deb7u2 x86_64 GNU/Linux"
    system:      "debian/7/x86_64"
    bash:        "/bin/bash =&gt; GNU bash, version 4.2.37(1)-release (x86_64-pc-linux-gnu)"
    zsh:         " =&gt; not installed"
    . . .
</code></pre>
<p>We can find info about the current and available Ruby versions installed by issuing the command:</p>
<pre class="code-pre "><code langs="">rvm list
</code></pre>
<hr>
<pre class="code-pre "><code langs="">rvm rubies

=* ruby-2.0.0-p247 [ x86_64 ]

# =&gt; - current
# =* - current &amp;&amp; default
#  * - default
</code></pre>
<p>To find other Ruby versions that are available for installation, type:</p>
<pre class="code-pre "><code langs="">rvm list known
</code></pre>
<hr>
<pre class="code-pre "><code langs=""># MRI Rubies
[ruby-]1.8.6[-p420]
[ruby-]1.8.7[-p374]
[ruby-]1.9.1[-p431]
[ruby-]1.9.2[-p320]
[ruby-]1.9.3[-p448]
[ruby-]2.0.0-p195
[ruby-]2.0.0[-p247]
. . .
</code></pre>
<p>You can then install the desired Ruby by typing:</p>

<pre>
rvm install <span class="highlight">version_of_ruby</span>
</pre>

<p>To switch over to a different Ruby, type:</p>

<pre>
rvm use <span class="highlight">version_of_ruby</span>
</pre>

<h2 id="step-three-––-create-a-sample-rails-app">Step Three  Create a Sample Rails App</h2>

<hr>

<p>You can test that Rails is installed correctly by creating a sample app, which will live in your home directory.</p>

<p>This will create an application called <code>sample</code>:</p>
<pre class="code-pre "><code langs="">cd ~
rails new sample
</code></pre>
<p>We need to enter the app directory in order to have the correct environment for launching the Rails development server:</p>
<pre class="code-pre "><code langs="">cd sample
</code></pre>
<p>You can try to start the server now, but it will not execute correctly:</p>
<pre class="code-pre "><code langs="">rails s
</code></pre>
<hr>
<pre class="code-pre "><code langs="">/home/demo/.rvm/gems/ruby-2.0.0-p247/gems/execjs-2.0.2/lib/execjs/runtimes.rb:51:in `autodetect': 
Could not find a JavaScript runtime. See https://github.com/sstephenson/execjs for a list of available runtimes. (ExecJS::RuntimeUnavailable)
from /home/demo/.rvm/gems/ruby-2.0.0-p247/gems/execjs-2.0.2/lib/execjs.rb:5:in `&lt;module:ExecJS&gt;'
</code></pre>
<p>Rails isn't finding an appropriate JavaScript executable.  We will install two gems (Ruby packages) that will provide the necessary dependencies, into our application environment.</p>

<p>Edit the <code>Gemfile</code> file, which contains the specifications of what the application requires:</p>
<pre class="code-pre "><code langs="">nano Gemfile
</code></pre>
<p>Add the following two lines at the end:</p>
<pre class="code-pre "><code langs="">gem 'execjs'
gem 'therubyracer'
</code></pre>
<p>Save and close the file.</p>

<p>Now, we will run the command that will ensure that all of those dependencies are installed:</p>
<pre class="code-pre "><code langs="">bundle install
</code></pre>
<p>Finally, we can run the Rails development server to take a look at our app:</p>
<pre class="code-pre "><code langs="">rails s
</code></pre>
<p>Point your browser to your server's IP address, followed by ":3000":</p>

<pre>
<span class="highlight">your_IP_or_domain</span>:3000
</pre>

<pre>
	Reference:
		How To Install Ruby on Rails using RVM
		Acess at: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-an-debian-7-0-wheezy-vps-using-rvm
		Online in: 24/06/2015
</pre>