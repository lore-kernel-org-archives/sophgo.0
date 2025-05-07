Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A804D25B67A
	for <sophgo@lists.linux.dev>; Wed,  7 May 2025 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619963; cv=none; b=qgNsgIfumbF97PDFAmgyWbhwfNhfE1tjG6EXxXmC7h62JZHZ0izGbHwErtiIf8CfqPwpCDJZGaX5vGF7ayg6fln7/i4q5Hf/kvEYR75FjHI9U7pBf7pUzOMs64pRA3GzSz8xRNBpAKFz3To6sX/qPFSgL+pnz8JE4Ih1eJ/6Py0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619963; c=relaxed/simple;
	bh=NTJibCf50CAjVuEafBvvdZitQuGBn8OdsxGG/m2j3pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzIcBWZQPlnG9yeBtlynUpsf/Oh8P+TOh5O5hfsAy0EuH5ntJGH/wAt6xqC5GIkY1ogdSkWTu9NMmtDzh1LYo6E4gXXi91ySu6E9pQN+xRM1nq6BZvcmFd/gP+GXhRiXzmzi0rLQRAOEF7x+LFoEI/Hdd7DhZc41xjZ9Ncqdpqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/4aLEA9; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/4aLEA9"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-477282401b3so75264111cf.1
        for <sophgo@lists.linux.dev>; Wed, 07 May 2025 05:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746619960; x=1747224760; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPsoooWg4OqaRHlbly3mLyR5VjI9H02/rBL7wWZH720=;
        b=e/4aLEA9GyXHQjkJPIudqO5M1cFvSNDAtbZNwtlgLfapoe0Y/rjuff3KWVNTVGepKU
         jyo+d9CPsdRNr/GE4Nfn8PTfQz730Vfhcs/q8qru0I8dE215fHXo2O8885+lrzoy9YUb
         h98CK6PCZZXVFGBJR60wBsPs/xWQGq8O/ac3tNDP5jVGnpFJv8STsR4Dy/BKHTYr4bAv
         nuI4wmQXxOG4J1kc5rg3nPptlUHfU7ROAHTYL2sw4+aUUXRPF1DVBuonLBm9SxXhjmaJ
         JtCU5P6XU6pbt8Rk59I/LVVkxcg/fh7vK2h+D7pqB50Or1U2XNZ8fgXXSDXNHb8CWvH5
         E8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619960; x=1747224760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPsoooWg4OqaRHlbly3mLyR5VjI9H02/rBL7wWZH720=;
        b=a9FPkADfxnFzBLqApy4bZclLuCzcYYMvhXIBxKjYBTyD8JwrdrRcuAL3nE3Acq3hii
         +Jf4qUsJUppnflcTU+7uPBp/ecm+ESi0hEj2o+hKCSkjjmSSriSdOmb7RgZlF61sZKem
         Igu26XipplhaoaYIcW1Kx2RCd6RxPBbkP3b7yQx2qBMUPm+Vcj5Q1ABLymgxqNU+mNCY
         QJ8Vm8ts2w7Ayp7JME2l0kkrCPJQeRK3Z76TFzsgvzumBmHu0rFmPXD0aMDam0fmF1U7
         YhKIdgikI95VINx4+sVHLWIBwG1hcLMJCZU+Dp2dHziJpebn3Iw1ZSxd+SI2UW2DZ3Up
         yNmg==
X-Forwarded-Encrypted: i=1; AJvYcCWCymWHHSL6T4T8vP+QajVH0mHDdqs4l2TDIs+Ol8vNhR2KVl7KxMLmycPPf9qPsIk1LXPku28=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO6hy2ocTeaYKJ3hbKLX19kyUrp8ghstK83Tl0P0ra8hr7WV/m
	m6SPJms2xAPjRLEVBj+AxMcO9JFV7tBOyZQNHayZuIOX1wmSE0QS
X-Gm-Gg: ASbGncts6MBKK9UnTMpXcvrNosmrBaMfXY0ngKTkiiX0nPH+AvKDJ7yNeY/hSqpZCYO
	GdycCiHnVRc3m/sJEyMwj7nfR/w8LDR5YSRR/fF4HNsdOq9zqLpXh+LA+Ef2DoxOZECUSulpfnR
	o6Nr7QOGj1qTQ6Bzjpb7Dam9P83DGZunXmXKM+HWTZB73k3A3rJaEme33eGV93uInH5ZIFlBJJl
	Xz4R4jbagUgCuq56RHDvxMK5g18Iq3baTt+wF0mMJvjiH+UAFFp1aVV6n+Gan0pgfVqOQOMhAK9
	8rIxa2I25nYvxlNyGEqExhd6XRQ=
X-Google-Smtp-Source: AGHT+IF+xAR2WQjzDO+vIUWI8jjxec8uqpCsBLzZkg9sR/PWtFFsNdHWPV68BfWwfEFlP9RAJp6xDQ==
X-Received: by 2002:a05:622a:5c0b:b0:476:7e6b:d297 with SMTP id d75a77b69052e-4922795dce9mr48650121cf.41.1746619960390;
        Wed, 07 May 2025 05:12:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-49222d9eaa5sm13514401cf.49.2025.05.07.05.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:12:39 -0700 (PDT)
Date: Wed, 7 May 2025 20:12:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Conor Dooley <conor@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
 SoC
Message-ID: <myug24f2rnscxracipkv2ghsjlv32qcyui6u4ckpwtaij6bw3x@yesvbm6vh5ls>
References: <20250428-water-sermon-eefdfa511f8d@spud>
 <183aa9ef25290278.6bcb31a17e34dfae.e6a8b825df767676@Jude-Air.local>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <183aa9ef25290278.6bcb31a17e34dfae.e6a8b825df767676@Jude-Air.local>

On Tue, Apr 29, 2025 at 02:44:10AM +0000, Junhui Liu wrote:
> Hi Conor,
> Thanks for you review.
> 
> The previous email accidentally lost some Cc lists :(, I'm sorry to
> harass you.
> 
> On 28/04/2025 17:55, Conor Dooley wrote:
> > On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
> >> From: Yuntao Dai <d1581209858@live.com>
> >> 
> >> Add mailbox node for Sophgo CV18XX series SoC.
> >> 
> >> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >> 
> >> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4176fc95c2c8be52 100644
> >> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> >> @@ -55,6 +55,13 @@ soc {
> >>  		dma-noncoherent;
> >>  		ranges;
> >>  
> >> +		mailbox: mailbox@1900000 {
> >> +			compatible = "sophgo,cv1800b-mailbox";
> >> +			reg = <0x01900000 0x1000>;
> >> +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> >> +			#mbox-cells = <2>;
> >> +		};
> > 
> > No user added here, is there another series in the works that adds a
> > user of the mailbox?
> > 
> 
> There isn't an actual user node in this specific patch. I used a
> `mailbox-test` node to verify the functionality in this patch series.
> 

I am happy to see the way you test it. Can you add it to the cover?

> The intended user for this mailbox is the `remoteproc` node. I plan to
> submit the `remoteproc` driver patches once the corresponding reset
> driver [1] is ready and merged.
> 
> link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochiama@gmail.com/ [1]
> 

I will submit a version for this in the next rc1. I think you can submit
you remoteproc patch in RFC to get it reviewed.

Regards,
Inochi
