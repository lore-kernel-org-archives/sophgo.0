Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E2D322A
	for <sophgo@lists.linux.dev>; Sat, 17 Jan 2026 00:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768610274; cv=none; b=iiR5whhd3TBT88Kj5GWg6EgrbPBLTar71nMK1xNzH31EWQig4bLb2spm2QAkaX2W1Mm/ICuj7aFx5JmWbmGpIjeL+Sre1OTwkPf1yo6WhoqcOVLGxCqQTNVjG2KvjrxFy2BtrAql4DeFzgI4so9hzak4D0hygmIvpsfk8s9DzGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768610274; c=relaxed/simple;
	bh=znyQ+dZG4FmrCdaja/PAQUFVQieYDJ5NvjiGGHTkMq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZC3HYCivLB2R3dopJ+CIdKhWCnJPCXfl3NFALFz6l67zlW/s5SX2PN+NWAAgdB8VBd7ZaiRiGLHG8Owvm4r7/amAPBJZJiJgniz5GzCzAtrH2wY62KxBLZPEkNNhCbHI1ZTEb4GFYQxN4/drlP5sib/3t744Ju2mqXxmJ1+XuZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvNgcJca; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvNgcJca"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6c6f89f23so1015225eec.1
        for <sophgo@lists.linux.dev>; Fri, 16 Jan 2026 16:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768610272; x=1769215072; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwUvDT/SlBc0Eqpr7nL2iXfaEJNSim3jrEuKQhva72I=;
        b=TvNgcJcaMr9SqvwDc49dq1vUo8zX1r0+JkiW/O5sFK439ZQOpI+vwsNLgj9b6TbISc
         AyOY8W6Ai7nKHIX2Otv5yoO2PICnsPEMaZ49ZeNm9yaizkhcDViK7ODuCy8AWF+1+9aB
         L28o2llmaT4Y1R7U2WsuM/MH3PCWduKaTS+SbUtzAiXUmz/zkFHZZObc/iH2RmuMyiV5
         3rnNJ929J+ZyER1YkNokH+WAANwQO9okmi0u01nItAZ4r4j5IUs47VkS1K3/wwvk+zEK
         vpkS08TfREv9R9vl+PrAt8fMW8RgzhULkDqeebiTzmdoSDFgCUgFgIDn2RsncAPdPsul
         k+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610272; x=1769215072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwUvDT/SlBc0Eqpr7nL2iXfaEJNSim3jrEuKQhva72I=;
        b=F4338w3GgJu6oO5luMBnZ0/oPtAP4U/c8luYOufRZDjzvBEc8wbPeY848oqCshrkRC
         bdSznbl6JvXXHYPo2fJXUbpc3gHkE+kQa/O5io5HeZd66F1Zehfmz4uTF4rCPmgifpvD
         PL68dxhWuLRwOy5y0NGNVsgZ2s2Bk+tOeY/vHir9IGXP6lzSA2KI9gP/RkobKy+80FyP
         jRhDN9iFfqQ4tsu/8jCHfwau6KRHO1VKCKONCK8AUR7bcDXuKHHoOxYa9JN04hV6OF2c
         UEkSQm2oDJ+pc0pIgSspg4Z5V3ugFFQxj9AYcgmS/VIA0cWwC4/JCvU7YLRQ9rDbolth
         gtDw==
X-Forwarded-Encrypted: i=1; AJvYcCUryJhy1rz3D0PbuMOqLfbZlJAQ25OriEo2qLPXN7pfomg6Zog0PxGaB381ufjMTF9fo0Ox6rw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpMWGJmlJnfi3sM0aW4T2yA4cVVO0IRQvAX6jUFRvvc1hG2+4/
	YX1Shhopo4zLNp6KbJ8wvN3HoRJ+ivFpM5JvsjsCfxS6bXLs0kJhYeYX
X-Gm-Gg: AY/fxX53vCu5+KlALzz29ENSTAcUzJasP3vjAH9coUWG7pjQCzxhxY1brCWGw3TuN09
	UwB3LEzJhSOsGhAwSQUv7zOqq37aHtB7Tx1qNlwPeS/BrTVEg4Vwn9aL9hdWTQXnLaqlzPKgeQq
	82//ymni0vERxak7G8EgcEjRIWJHjhdacyrSYXRzYAhj5LuRiSFhldHj832eosJrglz214jKSeO
	yBoFz3B3URXwCOoCp3KUkx6pz8kc1ofoHYk2U9RUx3Tsl9s6nbGbaMn6FNiRIN1oAcKP5URnZWW
	kfxH2sZFMfixtHFqhcwb2Pm13YbsgYbdhsrPe6WzjkSNKuwYOK0FQDVweOIt0/nc1LkYUvkYTnE
	RrYihANhQVYUbIgKswohTuFf8qGEnZ8NEzdV3trHvTg4DjFqU+YLNWUSUJZnM0b9T6BZgfkA00v
	dkUajmHl1Etw==
X-Received: by 2002:a05:7301:650c:b0:2ae:57be:86ef with SMTP id 5a478bee46e88-2b6b3eee816mr3461799eec.4.1768610271891;
        Fri, 16 Jan 2026 16:37:51 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a7bsm3954639eec.19.2026.01.16.16.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:37:51 -0800 (PST)
Date: Sat, 17 Jan 2026 08:37:45 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into
 CPU dtsi
Message-ID: <aWrZpoMOwTnFqlGN@inochi.infowork>
References: <20260113023828.790136-1-inochiama@gmail.com>
 <MA5PR01MB1250082D757C8DEFE005EE71AFE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA5PR01MB1250082D757C8DEFE005EE71AFE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>

On Thu, Jan 15, 2026 at 08:49:54AM +0800, Chen Wang wrote:
> 
> On 1/13/2026 10:38 AM, Inochi Amaoto wrote:
> > As we have a separate CPU dtsi file, move the PLIC and CLINT
> > node to the CPU dtsi file. This will make the sg2042.dtsi force
> > peripheral devices, and make the CPU dtsi force CPU related
> > devices.
> LGTM, except for the word "force" in the commit message; it seems a bit odd.
> Perhaps it would be better to write: "This will make all peripheral devices
> are defined in the sg2042.dtsi
> 
> and all CPU-related are defined in the CPU dtsi."
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 

Thanks, it should be "focus on", I wrote a wrong word, If it is
OK, I will fix this mistake when merging.

Regards,
Inochi

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 305 ++++++++++++++++++++
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi      | 303 -------------------
> >   2 files changed, 305 insertions(+), 303 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > index 94a4b71acad3..509488eee432 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> 
> [......]
> 
> 
