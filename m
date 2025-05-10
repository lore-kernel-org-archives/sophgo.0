Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E51D6AA
	for <sophgo@lists.linux.dev>; Sat, 10 May 2025 00:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746836182; cv=none; b=YTkI701coH6vESuZlrTFdoXk/bSM/AC4JINww/WFvJXaTiNLf8lFS0k8c+Xwv+yU3tf0B6YHElKLVhIcZSYGZTfk05lLD51Yi9DW3GnCuImdXYY7646JIVQLhhX1GcNq6hUnEAIIvOulsh1HUkYBsxQZNfemRabvVq+oIZ5P7CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746836182; c=relaxed/simple;
	bh=bRwM6L/RuneoVyutP2ZTSahmcEY98vH+q1jNXKgCS2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx0oRCDH9Tlyn/qbWCIR0Bzgi/eudWfbkmBvu2ZGaDWAaR2Bo5u+IJ43B+TlQjjn9sdloN/PLCirp+eLDOYk1z41p85iJxi6cmmlhyex07o4O+mteFMdDDAOMhTsN23iKvsa+58CM2tQvheMla7BhjJaX+cjztlX3vdszeVxhX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iquDA0f8; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iquDA0f8"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7cadd46eb07so289971685a.3
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 17:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746836180; x=1747440980; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SFtVXCVSeg1kTdZcyNbfJ4jRT+3FPuL4xzH9FGtq7M=;
        b=iquDA0f8lH/S7BEMLRhm+apUNnAlESetFT1Ehy0FqR5OTauvA8UVbusnlAIdwAHd5s
         QT4ELIgl64do9MuXzqWPT9Z9ofzHJ1kXtRKMhnJG6xQdhhVqjp53CzWTTZCf3yH/qwmZ
         k/HBmGb/39kEY1beGXh5OQQ3rkYQrE4zw38AJgR26obTpWpUT8dNpbcFy3zbkhjh002c
         0oxq5WhOctOmPjcKAN/kLXngw6gwFcRrlCUG9GhWBcaBqLGooGOeRnqtGFweQx2AvQrg
         clAun1e89aKxHwAfpjmVf10ZCplQGJ8biPRiblp1uVOGppQ16S+IQ8zKVQBLT74qCSTa
         cQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746836180; x=1747440980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SFtVXCVSeg1kTdZcyNbfJ4jRT+3FPuL4xzH9FGtq7M=;
        b=jIGs9b80O28yPfHqCFXfuHhgFms/k87B6bjLuPDuq4zc1Ema4frDdEB+OencyLhjrH
         L+qiKl/+ZVoFleakk15Eqcza9RNSjP2cWjSXyCnaAt2zrUU3Jb/KCa0a5o5Xuot+udgR
         zQFIbiP5eUCPNPXML5XablK4J87UHgklfZ8XXzlQhupbluaWCbqvFVUBcaAfiFvu9+pB
         /8R10yvnTgN8c3NrdeQVRt+Sk0s9YgYkltrKPkbtNiSkCswYMjWDWOd6CEg8OzWD/IMz
         6qZ0XG+4w3bIwUKO98YLApznL2oEPNxaxCvZsPq7JZflmsC69KSwf48FclOd1mOAWLo5
         3Ppg==
X-Forwarded-Encrypted: i=1; AJvYcCW+/h6ysfSpeDFB/LTKwKBOUkmN0BmVfErJbKdJqJXJN/mExgwwCzFLH41ZmEv4gBRv/oU3VmQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNDFO2msDBrhhpReqCR1+4eSPLhnuWrv5HO4iQTm+XDbLfuQf1
	hUp7KhovzILyUhATMJkFq7Ls3tk1/wt3Zqg4ns7Bb7H/KJu7JEP+
X-Gm-Gg: ASbGnctpkSvYi/Yo5/djEFRwcb2jG3rmcpB6U6jE8V7VS5tHzM8Jps3G4JOXA+tywTH
	+SpPlWaDEivwcmllDrnlNrqUFDIxbAeKORhULMZV64RSqe0Y2iHA2URdn4znKPZlKjEtjVnq8DG
	a0ikAVqeaNN9R5EXGNpIaYVKjGmwCbgaNP/9X6yB5jJK6kWDizRVRPmlPpmK4ClOiTu4nkd5cUn
	HnEdUVVRznurXkA/Q3byx5pUNAMuzPhCQZrDnhWsijxbD72wYMPGOeouLbdQx1kM4PJ2XslA5WK
	elNwaC2mYFv9e72FXdWaz13ZcBk=
X-Google-Smtp-Source: AGHT+IGsj1/7ro2DBatzM79BSJawe4AwdDgbJzQySrStNjoHX1NPEW35OR2pnN03ieEV/qqsQHjKNg==
X-Received: by 2002:a05:620a:2443:b0:7c7:b4ba:ebf9 with SMTP id af79cd13be357-7cd011053e0mr885707785a.22.1746836179840;
        Fri, 09 May 2025 17:16:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe75fasm204706685a.93.2025.05.09.17.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 17:16:19 -0700 (PDT)
Date: Sat, 10 May 2025 08:15:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: add ziccrse for sg2042
Message-ID: <clgoceu52ecsdnb3motp6eciiisalwjxgi4msdisgtdy3rxsvn@5hh4lzd4mh7q>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
 <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>

On Sat, May 10, 2025 at 06:42:02AM +0800, Inochi Amaoto wrote:
> On Sat, May 10, 2025 at 06:11:23AM +0800, Han Gao wrote:
> > sg2042 support Ziccrse ISA extension [1].
> > 
> > Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]
> > 
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
> >  1 file changed, 64 insertions(+), 64 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > index 927e0260acbd..04a6875574bb 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > @@ -259,7 +259,7 @@ cpu0: cpu@0 {
> >  			riscv,isa = "rv64imafdc";
> >  			riscv,isa-base = "rv64i";
> >  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> > -					       "zicntr", "zicsr", "zifencei",
> > +					       "ziccrse", "zicntr", "zicsr", "zifencei",
> >  					       "zihpm", "xtheadvector";
> >  			thead,vlenb = <128>;
> >  			reg = <0>;
> 
> I prefer to keep the maximum 74 chars per line. I suggest wrapping
> the string. This apply to all the change of this file.
> 

So, I mistake something, please wrap the line with max 80 chars.

Regards,
Inochi
