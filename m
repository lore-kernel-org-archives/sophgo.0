Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEAD224B08
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630618; cv=none; b=gEkNX2mt0lK22FnaiEb7+viNAv+WYJostksL8vaZdzGPz9dRDVW5VYOmugCkyjFmpqOO5W47UG35koxUt4ZEgmiIU6CUCct2yM20c3C35Zr3u3DX1IHSGyYni+fdI4O0tpZsTVhN2WehW6noWkc7y1idhOX/6Wh7BFjnQYkxByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630618; c=relaxed/simple;
	bh=jZ9Hv45HUZkteVQv6ya9VOMC0pxuG2odAMafRrZj2qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNtnI0smpB10XQFrM02gb09PKBzlyCFMzSSZI4/kGD/R8+8884r05XufWjvMGDZmialY6jDqw5BtiBVaPlzklfpEzbwPMFodb/SRUPCY9xiiRPlU0G8Ee+shf34u2aSBucZNn47rHXdUzve6vpnuVAMfC3tEWdTrSN1dVbn8P/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeYiBswq; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeYiBswq"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d3862646eeso220134785a.2
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630616; x=1750235416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcSP2lVjFJ/bu0C3VkfzSJDndgidRs2bj0/IW68A3/k=;
        b=QeYiBswqPSayNlJ6Paoe1sPOkIcqXYQV4mbNpFEVhBLO1Is+BrEgCcg2DjhLADkG8j
         X3o3ev6NfnDlPXfbGC+RyLsejZuEC9NHsuZOw6l9MCMglx04y4RUaQGz3Pl/FFoFAk0a
         7zFRk/PhpXm1bkqu/NSkUyByAThrS1KkBr4G08c8VP2SZf53CmkVyQFiOy884I6O4+yQ
         JTBjCxHjHPdI2mRrVZdjs5UNt7xGLu1QpcjWQ2sKIbVdo8tefw/iup8+oxT5T6pwqSr1
         VAH5VKShK6TCDNNNw9qn6uk1C+adJcp26aq9pwHgBmQ5HZjDYZpDKs4V/Fnmwuk/0fNM
         wJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630616; x=1750235416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcSP2lVjFJ/bu0C3VkfzSJDndgidRs2bj0/IW68A3/k=;
        b=j3G8agrFXt6H/x/txrfEE+3KiQGa31kXcbRiELqeyLj9WAfzdA7ehFELSHUXXSOxAX
         gUYDBzI+el5u8dkYdVMuXYmUrJnULS9XCytmzbOUPYTSaRTzfhWx09062xF9MI4ANEQ1
         TuksK0HBi0/JjqVxnopUDeOPzcLMWFv2vuaFrYAHjzgCh71OYcQMM6pt1UjxyNoqIwi1
         hraTv81DSF92WJzkpOm1KJ8QypJCHuIQok3KInpzAZYxoYvwVH0am7kpBfzWlFrfI+z6
         /ZQOuP3R0AUAigdACtmLVMVdioitzDvvzf6HnnfxVj+9xuW/gwU3+ZUWW6JU4EqKwFhb
         Xzlw==
X-Forwarded-Encrypted: i=1; AJvYcCUaCU98HjOO4LKs3gdgBOgUfWI4pPN4AiUG784N0tY4ylkbCncfHbrP4LuCeYUVFSuuKqE2s6Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0zcrbhne4HVWH+OKItQOcTR0HX1fmDLY7Ys2Rh/bQnxBbs6Lk
	8rPTnZ5pqZOyPQTzkA4P70VoRV3Jtde9Y/8eqYTPLn3fE1N09KGsoP91
X-Gm-Gg: ASbGncvf/P82ZkeUvmuzypeLGQNs79BBA1tvqtYaeW9+NU5OVmcBHy0N15hpFrlM4zZ
	XXtt0fu+hyxa7gcGgeuFQXpQAVJk37w/xHJzJwmypSuiCzTjTDlCJQGFA4beZXt9hKjBaZuIr2Z
	RR+5H1g1ugMhZOF1qU2u0AJf7ykxRrpQUtiDid+EyxJuJyARxtSjS88IblPn2a+CKOjJ15s7YIW
	2ywY8K2XDsaGfI3koxFEMrNiUSEFhKJP9E2APZGlaiVzzw03cNLWdIHIIQ9VbZF9386EGbtxyCc
	JVS+Kg+5PrOD/hutq6+Jrf6tv/gLrKmdgE9OpKaMQKhQI3Qn
X-Google-Smtp-Source: AGHT+IGCumupGFYJr2miTmB5pZGshAqhyq5KGLzPXAmspYahxEndxqWSVq6p8juUyI8Wq6JrkTAl1w==
X-Received: by 2002:a05:620a:2489:b0:7d3:99db:c4c with SMTP id af79cd13be357-7d3a8805820mr382875185a.6.1749630615951;
        Wed, 11 Jun 2025 01:30:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b2a085sm78890866d6.82.2025.06.11.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:30:15 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:29:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <2v4hfzqgz22k6s776onexnhd5cnhfr7s7ggvcmh4mfiviigq66@a2ehkwbv7oll>
References: <20250611075321.1160973-1-inochiama@gmail.com>
 <20250611075321.1160973-2-inochiama@gmail.com>
 <20250611-brown-turtle-of-election-87c324@kuoka>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-brown-turtle-of-election-87c324@kuoka>

On Wed, Jun 11, 2025 at 10:19:49AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 11, 2025 at 03:53:15PM GMT, Inochi Amaoto wrote:
> > Add bindings for the reset generator on the SOPHGO CV1800B
> > RISC-V SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > index 1d1b84575960..bd8dfa998939 100644
> > --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > @@ -17,6 +17,7 @@ properties:
> >                - sophgo,sg2044-reset
> >            - const: sophgo,sg2042-reset
> >        - const: sophgo,sg2042-reset
> > +      - const: sophgo,cv1800b-reset
> 
> Keep alphabetical order. That's enum with previous entry, btw.
> 

There is a small question for this: should I move this before the entry
"const: sophgo,sg2042-reset", or before the first item entry?

Regards,
Inochi
