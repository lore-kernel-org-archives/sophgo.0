Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B6226CEF
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554491; cv=none; b=CSCdbO9EjVS9xhxaRUDZQQW0foMdCOOQDjR/I0ykU02s+VS6/PzYmYzX1O4VEduzG7sYyUTUYI00YE/XTQRxmEAh6E44nZNhxHIklSQeQxGhEREFybBeRpwTniBpA89s2FTnXXWmyHMlj9YUsq/xbPzxGW+b7xa2fy67CZbpOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554491; c=relaxed/simple;
	bh=Lk6yHtpywKA2mu+OirYg/vHASkhb/xK68Pv5VAmQpp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrXfwThQyq9idSSfQzWu1F5V+sb610vSTm+SsHPpV0+daB9z2oh5fkbBjbr6gCJLvAKxsBh7okFCq5yaRxi9LjRSEQzrUbyw1XBbY46POwBASCprmkm7bAUzQcAvkQ5krd4d565CL247irr2YTwZP6AtCtkc5A8/IOS1ieNjsKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAN94+rg; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAN94+rg"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fad3400ea3so48167846d6.0
        for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749554489; x=1750159289; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=szmKV8/hLRD/BfhCLVO1JNR0megTPDNxGFTPqcHtGK4=;
        b=SAN94+rgt54avENyzNknaHCmJFYf/a5uIt2Zgw5UCVaroh0UzqppERnActfxO2Kpnk
         wV0h9edcRoxVOg3B5mXJoD+zZGZycxrF2WazF2d1E95/044AlAvnmW6KXYMLDx4LS7KU
         U+nqOlzPPBfU1PUdiMRKTvLjFY4NqBx6w3uBM5uiqrsRaLGzdOyXpnOaWBy6byLkBMk/
         iHsGfZ6rGvakPA8M4/445Z3Us2lei7/8R8jtjXl649muECwmtiKZoxxJs1BEmflJ+eaP
         CbjI8g0gbJ9GRinM0aZP2XPjm1+6gBiGS1iKUbYP40gnbRDd8xcJlO3YIzc/2KR5o/5Q
         3S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554489; x=1750159289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szmKV8/hLRD/BfhCLVO1JNR0megTPDNxGFTPqcHtGK4=;
        b=iHTzwntEmfI8JFtlm1IhpskF4AGBdUKDcQTGQ5NYrXK3VaRkM0gAjEf1eEZoaRKKT8
         4lfVSUyVivVepbaxdrLJNoG/bqWn0xUp+RZET6Cb9c9iXMDlZ1RDvXvOTObglzRzb5jC
         N4RQ99y0rEdKf/O45Id3EISx1WskQCVx6371zZmbzXKtdsLIxU/sMiOZ3Y31JaJID+SP
         q22gb2BjvjvIbK1fai1tsmDaZCEM55Ffm1GXRwNvVTl/hJyJBcpZKRmpnVQXr/DLObhQ
         oSVQ+YcSG4NjibXgfEFodJfcKV4Oy0VdEX/VS6oMczRs1/yMy9YuGlZOuBaoL3l24myj
         24Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWjMEsq+dChuXTqwS4Apfi/vlp6/6kYuXhNNyBBBg/V2+0UI/gu2SaupO0PDsBzmJFFC07AxMk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvVDs5MbHmmgxra4n9TX5dBzThZYArAQHIGUBcMSsUe+GDSnwy
	UORlbb7TNIczBsJpLUoLOQIH7y18VwTanfiy6yGwBWR80uYNKi9AmMRq
X-Gm-Gg: ASbGncsmYTLniKsh7795hlhor0c6acOofyldbf04IkbkMHL883AL/hep+12W4s3LXiU
	B/gR8Ebb5FMNYeTRSct9doOaMFZ6voiP1P59qkWsWjGZBtIq6GMZfZyM+PS5prVmtQyuFzyHHmj
	lNyxwUVIzN5VygTxtWnFGYaXFl0vHjIL94TuwGx2ij76q4/MwY0bKplUyS0Ogpc40n52+bDMpxP
	d+o0KB9L0Tz7gx6xNp9Opfs9k8LpI9Bt4VaDH5yPbwCkE22+EEIVpk3rBtlOl4XfevPwCGw9Wam
	54qpbhMeDYofLRc9yiXi9AGt8Ms8FMwuzPHd1g==
X-Google-Smtp-Source: AGHT+IFY5rvDpdmdyeaeDG/4L19R5LPs+YWIFLKwWB5tjYm4meLynLzPKZHGYa0vfPuvDWlt/nZlZg==
X-Received: by 2002:ad4:5f4e:0:b0:6f9:201a:c05d with SMTP id 6a1803df08f44-6fb24cabc19mr37122406d6.33.1749554488907;
        Tue, 10 Jun 2025 04:21:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1cb6fsm64260546d6.79.2025.06.10.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:21:28 -0700 (PDT)
Date: Tue, 10 Jun 2025 19:20:21 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <qsxwdfgrn2wsho3cgqbkfrmzngwbnt3mymem5rf23xpu7s44mm@mc7bzri26sfn>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
 <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
 <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
 <AS2PR09MB62968E478451D6D4480A8FCE946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS2PR09MB62968E478451D6D4480A8FCE946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>

On Tue, Jun 10, 2025 at 11:09:26AM +0000, Vladimir Kondratiev wrote:
> >I think all should be removed and it is OK to use old >THEAD_C900_ACLINT_SSWI
> >as driver config. At least for now, I see no similar case about using defined.
> >Maybe the subsystem maintainer can give some more meaningful advice.
> 
> OK, I see. Then, in the Kconfig for THEAD_C900_ACLINT_SSWI say it
> selects both THEAD and MIPS variants? I am a bit not comfortable
> keeping THEAD specific option for non-THEAD stuff. Here it is indeed
> good to see what subsystem maintainer will say. If I remove logic added to
> the Kconfig, maybe I need to rename a single config option to just
> ACLINT_SSWI and list supported variants in help text? If going this way, your
> input is important.
> 

IIRC, I was asked to use vendor specific prefix for a vendor driver. I
am not sure how it can be changed when another vendor comes, so let's
wait and see whether there is some advice to improve this.

Regards,
Inochi
