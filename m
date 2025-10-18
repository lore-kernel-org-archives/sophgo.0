Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0578F59
	for <sophgo@lists.linux.dev>; Sat, 18 Oct 2025 00:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760748180; cv=none; b=S905p/gbNWYeUMIT+kY4ydahwN/FI0NlJe42yepN8s2EMDi8xOw/z6AxDuomM9hCBMtXqLwdS6YVA572wRouDMtMFaS/0FmjjtGvfr9OWElYc5K6i7bOgubsAvwUNsrdY4BEFxjufb5WnNNHpw5GuYH5z84wBJIjw8v8/TRwJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760748180; c=relaxed/simple;
	bh=s243szStB9pBK3RcKWUDI2cHVqPoJDVQfeeUTlKRVJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4pze+jFYB1i9I/gKPAc2e9VyiDDFd6FOErFFSA0sR/JPg2EkaNUeaif19GhpQZ3UoDb2xaAD0QFr4RESRaAI/WmJhHwO0KdCcjEtWSVsl1WMzZDiSlQg6Y5ALxM4Fes9jOGxMYLkgM9sZQB/OW2PQMTKk4u/CrMYMp3FLc8PqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLEp6I8P; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLEp6I8P"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6a0a7f3a47so2213295a12.1
        for <sophgo@lists.linux.dev>; Fri, 17 Oct 2025 17:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760748178; x=1761352978; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1PWNtFrwP/oSzLfkwsnt+/gfiH1RiWv5c2UepBm6CR8=;
        b=iLEp6I8PaCQ5u7VNq93/Ng0ObQEkbl4lBTZFPDK+XwBCe5rJdI/WqR/GxQc4TstFbz
         66tJ0WKPDtNT3mVaiFirEX1xgpDfqWM1ruy3WjuEcNvDDiW8Xa0oQnpE1xbBMzqKFHHm
         4+b+X3TkLX1KnsJ3q6Zo0o7Fsfd7XqFh+eApYAeQOpDi5kVhec0boJJQ8jcRDkzFvBC0
         r5uNvRAa224C4piiYyv1SQV9jGiKdLGJ6M74PJYk10BR/aMCUfYcxhY0WEOZVLUmZohf
         jA4aSk3lt66eRCDvTo9K9peKzcfYJnunsbBKMAWsPBsFsbGTDE8OhNX8EzLRhMR8ntic
         XLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760748178; x=1761352978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PWNtFrwP/oSzLfkwsnt+/gfiH1RiWv5c2UepBm6CR8=;
        b=jqxUeRT+K7WkC/TNSDa/C/Hf8epCKUw33D/FXPdrQBvkNXBIw10Za0Euq1JTFFm5ps
         fthy4/FtkpnBFIG9PWGRifuvUS2rL7O6jI4Qa+Xdsqiwn8gmzSPPAUM1B9xRzM4gj1xH
         ISLPAe5rMiXwmRH9qPYRFoatPYYhIbZiBNCuMaZhlj4B7Ui9fWZrsO8ekn3QOlP6NZ31
         fmSLRkNf/kN0ty56mIBmaoLE0nLO1Ajt6iOHUpl7sLOE4JDG913uZyuwiwFufEILs2Yp
         swhT90y0c5K6UV0/NuiXIK1qmjJDyiK69E7C/+GuIzoXJsurio6RXqP2CkuXAFhtgXNz
         vaGA==
X-Forwarded-Encrypted: i=1; AJvYcCUTYRWcoAN1DATEFHyXjsqYEVA41Q4kywKmjBNPajU4g6vUqRO08O6NtVXBtWg5T409INP8oZc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOkvIINVpSqQzCsJuqf4oFN7IuK7bwi6sCDq46l/W7cTf5oKa6
	qQaVotchjqHe1ud+jkuAI3ma+4MI86sjGzkAsAi6kI4xUfucP5/bViK+
X-Gm-Gg: ASbGncspVGcG5mkThafcFG7WDvdX1PfPxBKH/GIGSwwHYZaoSgCRfAvzAsjdD5fVsBw
	ax2/8C87ftUow/BO5y/JUsBqiW5q9oyvtMdJLBcBGdIVgg7PH/IfVGGPM5J7nTI5ib6Mc7LxmHh
	d4HZosr1Eu+jaX4SJlh438KK/nMU7VJQHlGavgpOFEHgoyzVMu4lskcMxJXEwuoo/LWsgRCFXuU
	noK6FW55a6cqSjOWVVP2qRIBLinETJiXUrLeApSPVxEAgeVvUWRKyoNJN6v6OWQXEwcIiEBjCnh
	3u1EfERI4aWWCcwL9eNYszjbm4xo7IzCkoRuF+vnh9KOPsMd2lBjABX2ZFHvTJ7IhNE89KgVkHw
	Eqcit5KvdtLbYE7Txxrwz5NFM+2BsWeI07FVPk2WPkU3vAtgb8knnsPh/D27B66bYyMOHhUD3Gk
	Q=
X-Google-Smtp-Source: AGHT+IHk6GRhreHj//S6E+ILpNLEY2kapbyNg9O/WZnXJ0JV/NPB8zjD9Ghulw354rOmUlzfDrJAcA==
X-Received: by 2002:a17:903:1746:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290caf85146mr63860745ad.30.1760748177829;
        Fri, 17 Oct 2025 17:42:57 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5874sm7975275ad.54.2025.10.17.17.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 17:42:57 -0700 (PDT)
Date: Sat, 18 Oct 2025 08:42:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, netdev@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>

On Fri, Oct 17, 2025 at 08:16:17PM +0200, Andrew Lunn wrote:
> On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be remove
> > when init the mac, otherwise the phy will be misconfigurated.
> 
> Are there any in tree DT blobs using invalid phy-modes? In theory,
> they should not work, but sometimes there is other magic going on. I
> just want to make sure this is not going to cause a regression.
> 

I see no SG2042 board using invalid phy-modes. Only rgmii-id is used,
which is vaild.

> Also, does the DT binding document list the valid phy-modes?
> 

It does not list. Is it better for me to add a list for it?

Regards,
Inochi
