Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692233CE80
	for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584359; cv=none; b=a8cP019sAMrNIi736BHQ6ab/ieios7wcJcfDDWloEo/9cAJyJju0SxXNvVPcx//YzcKQHjOM+SDH9Y95JV2KiomczrlPGxtOx8E0AeAqWq73D2aL9wYMi1Nftg6jdK7JOBqikwoSd5MipZStM3ixQQKbgIz9y/1mDep7sM7TfC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584359; c=relaxed/simple;
	bh=YdviBTA8jRw1D2gT88VYxUJR+OiJuzgjG+E0JzrSNxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skLXneQJD1NELsK0yd7O8YbFT3X9RTSVWXQDO/aBl9wq7peYDebUg1mXlBDs18MGDx0N0FHy34pn4PE3v38qSQaLOD0Y7fOnfQ7MevtA7jvWNtDJAEPjJOnDT4WYADT01VL4QncsJepA96Bv9hxTqH4xTdT4nh6QiwoPfKicXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7neEIYj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7neEIYj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432755545fcso1368308f8f.1
        for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768584356; x=1769189156; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guLdPSMspTYOQSTOoD0vgqQiAA/YDtF0X8jjlbY9les=;
        b=R7neEIYjdIHOn2C8URf0BsPUwdHfVkGewvr+l09dWk6kLh8hQkfNoUzwIqH3x2UpHr
         h7v3ateerEQuoKYW88KZqbmB7/uC1iIT7qyqLdzaN3HktNDnirkaaccu8n9nIlI8R4IP
         TzrfW94q4oXL4DObcEVN+qfrT9ictA6b96HVc3zmmPO73YXEJxzBb+xVbgidrHPywFRQ
         urWx0dbvjexBDDiHSDX0ODPr8LiQynHnkoTuGAAF16ZGEmHk0LYGc1hK1Hjkj2dGyepl
         dG6sal0h4y5awzDvI676JQjbBkIckW9EtVN/VDAk4z/zydMZIyFs3gEWWZTCXJXeYqzz
         +fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584356; x=1769189156;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guLdPSMspTYOQSTOoD0vgqQiAA/YDtF0X8jjlbY9les=;
        b=j0owBEPQMyTjAt4umBqGC9d1r8IyCFbHjZKjkKvUQ7gFuGB2Xp97o9R4A3bx6zLTlD
         0EYYar6olzKY2Ln+6ANO4W9CpkveKw23yiq+iD7fAe4sxi3EXbe+b12XTwwaR6oZ63xW
         jOPhnJvsoI9IHKkreFSgRvaeXYC2q98FCckpt2j79FCsDtRQAe9bzWErQRjlO+HLe+kY
         LlznB1Ou7PYVw1jj4rSpatiqxzRW6tq2NZNim42xLz3etIBJgJ9T8x/XH01Wj9zqb1MX
         0UdvFX4rtYv2pa9oMdL8wCIcn+RnTQqDGaF/ircaELx05kGiRWC18d8qj7zH3JdYf9iI
         AzXw==
X-Forwarded-Encrypted: i=1; AJvYcCVTTSr3bb/vVX7t+6ZkgAe646tytHFANxMi37FCgIm3BaZ6Urf+CUDOU/a66f2aQ8XPHcjj/4o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpQsnGGa3V86oPImvIKKM1vP7N7h4Gax0jjd9tigJ5LUM+tffQ
	OzoSLGipt6bHO3LislAvFTj0S24Skx+uLGLHZT9NGFTMqZSpuatuRtHn
X-Gm-Gg: AY/fxX7Pj7rAamy/sRTh9Z0oC6ubytwiK0rLBM3GmkGZzPzcVopW5FA80gqjH2A5P8A
	p5IzoHakC+Lg+/k9nYJ7v54b7dxKEQ4GNDA0MVxw40YLXYSF071uQ2O1fLfz30qd6RlC1hEM00p
	V0/cmwhIadlp9fnXEK5QJMEttBi8TIug8HLi6U5wDa2Hc10ZMc4P+7yXaTdYis3lW9m5tdGJJ/0
	8ztGsBSS5jZR2l3yNgxMgT96QyCdcA4Tv2N5mTJuSDSGzFh8UiFZjcANmFHiDMj7zmG/kzaPxBa
	aM+am7N0yMARp+YTml1MhVo3eMpZI73RkCD6rU+rRfdOSNpcb7ycQCEPrSV5lzUunZKXQSXGobX
	Pzfa1lPsjFywloABB+KAd1m3Ov6UDtiH+1k3kAxm75b0NXnHVYmcD+8OagXHfCrLWlS70o0uPML
	bH/qPJpqx0qV6fWmYByzGSem5ow/ukdDgIioVNrWTfw4IBdCUieRVFRN4=
X-Received: by 2002:a05:6000:3105:b0:430:f622:8cca with SMTP id ffacd0b85a97d-43569bd2aa3mr4952607f8f.56.1768584356323;
        Fri, 16 Jan 2026 09:25:56 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569998240sm6098837f8f.43.2026.01.16.09.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:25:56 -0800 (PST)
Date: Fri, 16 Jan 2026 21:25:51 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Message-ID: <aWpyLQ6FR8_RsD1n@anton.local>
Mail-Followup-To: Inochi Amaoto <inochiama@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <aWl4fvKsUZDg9dwj@inochi.infowork>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWl4fvKsUZDg9dwj@inochi.infowork>

> On Thu, Jan 15, 2026 at 11:17:37PM +0400, Anton D. Stavinskii wrote:
> > This patch series adds basic audio support for Sophgo CV1800B, 
> > as used on boards such as the Milk-V Duo. 
> > The series introduces an AIAO audio mux driver, 
> > an I2S controller driver, corresponding DT bindings, 
> > and DTS updates to wire the components together.
> > 
> 
> I haven't see your mux driver, is it missed?

That was bad copy paste from original version. 
Thanks for noticing this. Will update the cover letter.
I want to not overcomplicate already big patch series.
So multiplexing will be done later. 
> 

> Thanks for your patch, for all the patchs, I hope you write a
> meaningful comment for the patch, at least for now I found it
> is nothing in your comment.

Thank you for a great help with that series. Do you mean
I need to add more meaningful comments for each commit or the 
cover letter is not describing everything clear enough? 
Anyway will do my best in the second version. 
> 
> Also, the patch 8 should not in this patch and should be a
> separate patch.

Yes I've missed this thing. I will remove the last commit 
and move codecs nodes to the base dtsi file. 

