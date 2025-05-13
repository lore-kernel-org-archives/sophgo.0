Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A480201267
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171559; cv=none; b=EAAqVJvsVvAypti60d4b71R9jkkq8L+QTgGMeLoKFwh73RRzkIsewhNeVFzi4ZYWClQY76qowhGaG2M0imt5VgOpOL5X/PBVGbxMGrXXBDRQz3M7eqV1wIB42zlPb3zpy+XsGrTxLEs11HfqjFteiP4WRVqEnvbtYu7Xoxqnz2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171559; c=relaxed/simple;
	bh=PONCw9RTCNN6nn6z1Uu6GiS7int2V5KAYeMXT763Scc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLG5yBrsiT2a45XLoCNZk/+zT0f/mHc2zg/dLtyh1nJfpT+2CRdg8JKHfatx4MAoT4ghKqRmxcKdMHf76aGeFpteI4I1eOtslIcU53Z7OzQcVmnpExFX4P11Kpg714DxdCAjrwAjj7jYWlQkmMJ76UyhqVvGv2hSCZd/q6Juol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hUw3MXW8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hUw3MXW8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22fb33898bbso76499925ad.3
        for <sophgo@lists.linux.dev>; Tue, 13 May 2025 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747171556; x=1747776356; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3RlUrB9vsvdRLDB/WErlx/ApSJjbQf0jOu6HOFeS/w=;
        b=hUw3MXW8pF6EZi2p3NtmzV92VwbOqo7WwzYgCq0UuQtK6iu1dEaS76GWmmD+RAAm6T
         tGaiPzOfe8K2OI7rSPR/szTFMbif/2O1854oRoN5wVCX7T5yt581VccLj4h603nNu8hV
         A88sYmSVs2v2SpFxz62a+3VbqIAi/8xR6iZp3TElK35IrvWiwtMR8hYWuaKUYNCk3BMy
         GRpUDglxeyutIsR+Dv0ZdbZ+KmDSs0Jy1C+KBc7v9cWVfjQwhVGKh6h+oU58ePJ5wyKe
         vqIabNUVrX8oFKTA5Y6JGCex+7Hgg8rB7xjYv088kJzY3gKy7A07ulquLXu1j658mYrB
         C2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747171556; x=1747776356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3RlUrB9vsvdRLDB/WErlx/ApSJjbQf0jOu6HOFeS/w=;
        b=kh/CMHZLne+zdTox+Ac1U5KtgukMD7nNDSkmmOZhFeXS+06PzW4OHXCfoeFYdTMgem
         i7mWdMilwcad2M04I7xujS/0V+XmLThxfY3A0bm5Lnx2Et21uh0WHWCZXVRmsarkbZxR
         rnMxAbmB306luoGgp022rzjAPLLLrG49vEKltT/eFmckWbexc1bEuFmdWurdwCI/EQuQ
         eKD96yL5/Ks6bf2CML8fRI3oHuGPtbZHbLxHeCQTsUhl4+GrBC9HysjypPOV+Z9dVi9K
         Nw5pHm6oImKDVqNIKhNQpn2lxnPkmdKde0aqNnPazELBk6kJufNIDbE0yaez2gAMXF7E
         RpSg==
X-Forwarded-Encrypted: i=1; AJvYcCX758msV5ZPZ584Y3IwjsUfI0OfuKisUIVaMtjgj0fxXRvU5texZEhL95mfzSpUz4BQ5NEMLvE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuWKmBB5zj6Xlr04KQ6wRDo5Q5CrvN5kK1+dAlrpNK7qnrW0QP
	F+8oP13m0z+SEZ8p/WDJsAd86g7/E/QRdCpycytJKQ6GAXoeKKyepte+mbq3w1U=
X-Gm-Gg: ASbGncteosvyO5He8D9AkEkSTaLtVXNrC9EU3irstqisRNYh7GkPuAmxbbMh1TTdl9n
	jiljkyZzwILmS9cm3MRnRfoVwspq6XpvYKJ42PMRTr9AwxI+Heac+YzPcZG61kcM69Dr7DZKtfJ
	93cTP+s89XChhedxjqRCb3Gao4o7qlmH9bSeBcOwFPm7IgO6VVKhZGQxrq5F1mUsk0VntXANwxZ
	tuMe1feuaHycB3XNPwuWcXq7shu2T7BjrY/ovCWas2QbPGMv7RBTIj7yb+BKBOG0c8/HyY/1MmM
	RRFUbjy5a88Zi+7aVja9cVAIR2pZ4l8l6j9NcuvfFg==
X-Google-Smtp-Source: AGHT+IFocb82Pc+xAg+z3CR+mX8T9Fb3IZ3K1KpdH6BlWRo7TmjZ95U0igx6DKwvn349WA6Uo5EwQA==
X-Received: by 2002:a17:903:2f8d:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-23198116712mr13397695ad.1.1747171556281;
        Tue, 13 May 2025 14:25:56 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a1965sm85249085ad.231.2025.05.13.14.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:25:55 -0700 (PDT)
Date: Tue, 13 May 2025 14:25:53 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
Message-ID: <aCO44SAoS2kIP61r@ghost>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9zCYZ7u+nmQgSkgWgv+QSVb=miLRtcNQRfJFcd8JgcJg@mail.gmail.com>
 <MA0P287MB2262FF6EFEC6D01796683DE6FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-vamEx2f+nTJbd=WeB815ZheJV=mm7ohzBoZrsoaQV+g@mail.gmail.com>
 <MA0P287MB22629B5A1F6238FBBF9E3609FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB22629B5A1F6238FBBF9E3609FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, May 13, 2025 at 06:05:20PM +0800, Chen Wang wrote:
> Adding Charlie.
> 
> Hi, Charlie,
> 
> Can you please help confirm this? Is there something wrong with my
> understanding? Copied here below for your quick reference:
> 
> > One more question is about writing value of "thead,vlenb". See bindings
> > description in Documentation/devicetree/bindings/riscv/cpus.yaml:
> > 
> > ```
> > 
> >    thead,vlenb:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> >        VLEN/8, the vector register length in bytes. This property is
> > required on
> >        thead systems where the vector register length is not identical
> > on all harts, or
> >        the vlenb CSR is not available.
> > 
> > ```
> > 
> > What I am not sure about is whether we should write 128 or 128/8=16?
> > Assuming VLEN of C910 is 128bit.
> 
> 
> Thanks, Chen
> 
> On 2025/5/13 17:13, Han Gao wrote:
> > > Assuming VLEN of C910 is 128bit.
> > I refer to the value of c906 because c906 and c910/c920v1 have the same value.
> > 
> > Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-3-236c22791ef9@rivosinc.com/
> > [1]
> > 
> > On Tue, May 13, 2025 at 4:06 PM Chen Wang <unicorn_wang@outlook.com> wrote:
> > > 
> > > On 2025/5/13 14:45, Han Gao wrote:
> > > > You can use xxd to convert it.
> > > > 
> > > > cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb | xxd
> > > > 00000000: 0000 0080                                ....
> > > > 
> > > > Regards,
> > > > Han
> > > I can read this after disable ERRATA_THEAD_GHOSTWRITE.

You can also pass "mitigations=off" as a kernel arg.

> > > 
> > > I recommend adding some explanation notes in the commit message. For
> > > example, when we need to enable xtheadvector, the prerequisite is to
> > > turn off "ERRATA_THEAD_GHOSTWRITE".
> > > I found the relevant patch is
> > > https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com/,
> > > also hope adding this will help later people quickly understand and
> > > avoid my mistakes.
> > > 
> > > One more question is about writing value of "thead,vlenb". See bindings
> > > description in Documentation/devicetree/bindings/riscv/cpus.yaml:
> > > 
> > > ```
> > > 
> > >     thead,vlenb:
> > >       $ref: /schemas/types.yaml#/definitions/uint32
> > >       description:
> > >         VLEN/8, the vector register length in bytes. This property is
> > > required on
> > >         thead systems where the vector register length is not identical
> > > on all harts, or
> > >         the vlenb CSR is not available.
> > > 
> > > ```
> > > 
> > > What I am not sure about is whether we should write 128 or 128/8=16?
> > > Assuming VLEN of C910 is 128bit.

That's a bug. It should 16, but I had put it as 128 for the D1
devicetree.

- Charlie

> > > 
> > > Thanks,
> > > 
> > > Chen
> > > 
