Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0A61C01
	for <sophgo@lists.linux.dev>; Fri, 28 Feb 2025 00:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740703189; cv=none; b=L0jIY4dWUjKbaW9LjXYcWNOeanBow8gHb9PLS2tKhdwmgYV26QMNWoIsbbz6/PrR/yDp0ftTrxb2dWfe8gSQfWPmGTzhcW+7usJ2x1nVIHejSB34JTOKWdr0ib0lGpKry7klm7adbqycWUct/T3U8XUxlMw0EZGU4rzovzrdLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740703189; c=relaxed/simple;
	bh=v2ruyhUklWLE/O5IYzG1DXaxpknq5sYzG4l/avzLBGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpfAdSp+1/c6zSCUxQ+SvQZe1XhGH5y4+Clkr0uSOEaJh+wMS9lcqekqahbNaex02gyOX2N/vROw/PeJ9O5NicXgI5pTip5s8tALFoIxu3qSepY6hi9VHr3ANdRtqJAFQCZDSp4+abmP00ih+MisYLWvEqAsaoJK4mYrbglIKRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNHcuFr6; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNHcuFr6"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e889e77249so13711536d6.1
        for <sophgo@lists.linux.dev>; Thu, 27 Feb 2025 16:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740703186; x=1741307986; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NS+/iUnzQt3rNEJ1NDY4uxNPpsgUI17G/QJLjXrYJFg=;
        b=TNHcuFr673iqium1/bR1JMP64UEAsmxKI9C5Qz3jxYpvPq68P3vioiqhEiWuQkH2Hj
         YsFrbeQJdsrlN1uZqeJy8xsgsDbuT4NKQ3FDu/2u5yqVLgcgj33996ii1PHmV0/br3Xf
         aqtn3Crgk8Aqrfml5boPPLn7y8L4bSblGMIUJrm9ANumKUWmC2n0SYweipYAiSTdVxLK
         Xp+BIaP+Oebvq7y/6qyz2tedZmYqvkut9bFcJoEZg3LMhfrrplhoDwtNa55mN+o0bAzC
         EEIKdXDo4OLLVHP8Mso0R44AUm15JpBLQtpWiCrP9W3uffn4zUoj7dR3sod2K9Lw4oYy
         geFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740703186; x=1741307986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NS+/iUnzQt3rNEJ1NDY4uxNPpsgUI17G/QJLjXrYJFg=;
        b=EIESFhRwNpuYfrb+BfBUqQwep3ynu1U24n8SzPr8UA6rM3ACgmrM66I5+5T6WRFxna
         WrCcEc6pdPDw7Gune3678OvAcNCNks8pJcBwS+fPrzHbGFnjfvSSv+mLhizQxpCJUIXM
         me5fNYlrTMpoAgPoyijnY2Z54E0kgxZINmjiXvXxo2nmahMeJKNEw2sQpMNn7EHNkMRb
         zpuWbD5SmRbhWsaFRrb+qGIi4CL46FS+Lp6AllAfvQnn1OAmSUvyeGeixyt50WH1kxsT
         ekT08BzQ9LXNlyiKj/gpM4jgnKjCYf7FZDH1kK/ziy3UmJe6wpduEnElMD/5hT/lI7U+
         FsRw==
X-Forwarded-Encrypted: i=1; AJvYcCVd2uPf/01+mK3w0qXRF59h6YC87vsU4dHF1ai4cU5WtpvSxeV3O6VqvJuRVkZbgfcxeWRUvtg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiI6pM2RjJt4HCXtzGohcP5xHD5EcMtIEZVUekua9BdlCi+0QR
	IjvgoEJtF9F/89O39Zv7oqsk1F6Nje4M6xDI585JMAdAzfPcclCO
X-Gm-Gg: ASbGnct7XZrE1QF5XTE0yyB07ImcSWjjxVfO/mJ0JR8wK8hI9fIbjAS6k2FkvhsA8/v
	ipvLs2nI5yI3QMYYdf5phj4SFlqRDq1rzOkBlnwGuBuzbSmi89d7chTTZHOx1BMuhnTjPShfv+2
	oprk+mgrzi7PETPCDbH4LQLQLKVzOyMvZmP7z3JhzDYOjVFRX6eIHl8PsRblfmKIt5LYZzCCQrO
	YpdHtO6OFq9QxpnuEcKlbMexFapo+ITFtrsDbCX9eph8ALSmCpvE6xJcG4cR5HiIb8uRfL3/aU4
	RQ==
X-Google-Smtp-Source: AGHT+IGW6OtjFhte78/y7mXicDWR0r1px1BSDbRwNbpZXXNdzJwgIrFoEnObj2orAz8Dtj3dyg6Yrw==
X-Received: by 2002:a05:6214:21e7:b0:6e8:86d3:be78 with SMTP id 6a1803df08f44-6e8a0d94b6cmr23116156d6.37.1740703186527;
        Thu, 27 Feb 2025 16:39:46 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e89766166esm15959336d6.61.2025.02.27.16.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:39:46 -0800 (PST)
Date: Fri, 28 Feb 2025 08:39:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: reset: add generic bit reset
 controller
Message-ID: <57tveujqmthjxdaad67i3qv732zwmjcyymnsluyf65xdpmfvkd@cqrwhuylthmd>
References: <20250226234234.125305-1-inochiama@gmail.com>
 <20250226234234.125305-2-inochiama@gmail.com>
 <20250227133509.GA2021892-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227133509.GA2021892-robh@kernel.org>

On Thu, Feb 27, 2025 at 07:35:09AM -0600, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 07:42:29AM +0800, Inochi Amaoto wrote:
> > Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> > a simple reset controller by toggling bit. It is a hard time
> > for each device to add its own compatible to the driver.
> 
> It's a 1 line change. That isn't hard.
> 

Yeah, it is not hard. But it is annoying and sometimes
I felt it is a waste of time to add a device id to the
reset-simple driver.

> > Since these devices share a common design, it is possible to
> > add a common device to reduce these unnecessary change for
> > the driver.
> > 
> > Add common binding for these kind generic reset controller.
> > Check the binding description for its requirement and
> > suitable scenarios.
> 
> We generally don't want 1 register per node type bindings. That level of 
> detail in DT has proven impossible to get right.
> 
> Rob

It is not 1 register per node, but a contiguous range.
In most SoC satisfy the requirement, only one reset
device is added. This is what the reset-simple handle.
1 register per node is too crazy for everyone....

Regards,
Inochi
