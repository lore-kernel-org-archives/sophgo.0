Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66471182BC
	for <sophgo@lists.linux.dev>; Sat, 31 May 2025 01:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748655307; cv=none; b=qkNNccu49GQyEDGc523Gx7leN0ynG711kc1/aSP+MdEJgshNhwc9oHLGl9hnQCJ42bxfuOYJ4YOb4c4mzIJ1sbggtZWVcFZvt4W3A4tEjP244aZDpF4tiUJOGmA4L/v9xjEQchq7o7x/bzCjhckrTVWEfFqd9BFu26rOQEoJze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748655307; c=relaxed/simple;
	bh=1No1ni139Z7Dl+HzW13tFqEt2OLr/EgM5MD5+3+FOso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYi/lMzB8AWHubhB3q70Ls5SeyTHr+XbjARxnHQHFxDh4BDShKjJfoguWpJ8CNMjSQ62TnIY1+6B3GM6Jmtd2LZ0Ks+30pgLPwPNTDfarS6NzX5BwevkAlV8fNskZo2k2g4bFMW47h2Uj2BDBtj3HD9qBjBB56fw2aU/GCtKVlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hN6IlZCj; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hN6IlZCj"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fad3400ea3so10895496d6.0
        for <sophgo@lists.linux.dev>; Fri, 30 May 2025 18:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748655304; x=1749260104; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TEpkKf/rbRGMaCZnUiCqTPwyLbk3NZOTi/tOjvkQknU=;
        b=hN6IlZCjEhuE888CZg5QFH1r+ovEYFqdwKJObKBbBcT3FPhwjMNOOSVoully980Xuj
         bSLHOZjErg6wZxa7zOnsiyLinurrcr04+aAZ37DoEVj+aiqGnFewmwUKWj/Zf4Xa8ToD
         mSqIau8l+bJhaO2Lk2boY1VsZW60y9TCTIt/jOHbO7VaM1xHDu6mwDnYh7a3Bo0aD8i8
         5f0yYYgeFCfIV7A3r7dOmiZjU2JFbXBn8NKw1GhUnNC9GtHFlch1M9WTD73QfJ9V3xwO
         4he0cMG+gDRD0ahyzwzO5UObjRmge6mFUYQjbrtWfTxiknl0RQMEcadUhF9A4i6PUiDu
         HwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748655304; x=1749260104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEpkKf/rbRGMaCZnUiCqTPwyLbk3NZOTi/tOjvkQknU=;
        b=YVFVmLFbrXAqffIynbt5g/WQ8fqdI7aqGfx/MIp9Cl1R9gPxd4Jqe5d/bSygXEJNt4
         ZqlNMuM8vOvRM4kW9mMfsT7GnATwun+8E4UOJY4Lsk3nOxfeYzF2fGh+f2fmsxbX4AIZ
         QLpCE//uJCg/CXDoTgjsiQdsHiJNRJLucwVDRWTD/G+F2X2LAuUBoeg3+h9HyCifEDn0
         pCGT/w8lcbBA0zFenR1TDMrJMfiPDJspPYnrLIVzS+V55MaFc5K+24YJakzWKg70C5Us
         a1Y8JqGRYev/WIye0dpYTllEwzEsAs3YvlkFNwOb1RSHVMktSo6E33/nvG6F+w3pzQmI
         Ux2g==
X-Forwarded-Encrypted: i=1; AJvYcCUFUM3Z4w4MHjdt9x4SilcBYJMIaa9Rn8Wupkb/oumsGNmlRWoGXO9GBZEiOUbNy9BjOFKo414=@lists.linux.dev
X-Gm-Message-State: AOJu0YziKSx6U+TR7Ub/qg4d3o7zjBgO6sUnsHjBSlEY2hIWnFsjW4p8
	GqVjVAopHOsoG9qWfziB4bGQex8CQbqQs5wbHJjug2ts/dB1aKUH25P5
X-Gm-Gg: ASbGncsuwxXZfHKIbrusZ5gf/TEJSdzM3fQaJ/lLwEGe0I9hl5+sUiemrJMwF2+AXBx
	ooFsUugPhcjyqcfjLG09KwjItnnSLem2TlzaKu/9/ro0esBh4fcuQMh41a/PKaT6UpzirnkMNPC
	m1QOG6MYb4cOjtyN6TKQiQWqrNtsiWpq9OyDugCd9a1rhCLSdCdoiE1QxT67TnrkY9+k+9340B/
	kmt6+pbgaDVv0aXTesn6Si7mdu0vb3Oq5eRiUau+m0HtdKLoVdqcoSnyjMo1KNvCuexOjc4xIjB
	Vqe5/Ngt4nXg3d3nRrD4wafn+DrBLtibAl1/rQ==
X-Google-Smtp-Source: AGHT+IFzbQoEp2+Ph+a2o8b88ePR2Du44O7ta02t6SISNBZax8aMd+4dqDWmuWAErYq9CBhmxc893Q==
X-Received: by 2002:a05:6214:d02:b0:6fa:c5be:dac7 with SMTP id 6a1803df08f44-6facebcf4bdmr111200496d6.18.1748655304161;
        Fri, 30 May 2025 18:35:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d09a1a793esm324888785a.111.2025.05.30.18.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 18:35:03 -0700 (PDT)
Date: Sat, 31 May 2025 09:34:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <4vuneynwhmsyokkuw3wlabxij6kobl6j7bbbcymlcmsdc2hhb7@u5mhb7je74km>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
 <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
 <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-33DcA7xeBzzv1hm0wR_ebcVdux5fQxGVrLs45RbGM9A@mail.gmail.com>
 <MA0P287MB226265FFA15A808221629848FE64A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB226265FFA15A808221629848FE64A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, May 27, 2025 at 06:22:05PM +0800, Chen Wang wrote:
> 
> On 2025/5/27 17:34, Han Gao wrote:
> > On Thu, May 15, 2025 at 9:33 AM Chen Wang <unicorn_wang@outlook.com> wrote:
> > > 
> > > On 2025/5/14 23:15, Han Gao wrote:
> > > > sg2042 support Zfh ISA extension [1].
> > > > 
> > > > Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1737721869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C%28xrvm%29_20250124.pdf [1]
> > > > 
> > > > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > > > ---
> > > >    arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 256 ++++++++++----------
> > > >    1 file changed, 128 insertions(+), 128 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > > > index f483f62ab0c4..8dd1a3c60bc4 100644
> > > > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > > > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > > > @@ -256,11 +256,11 @@ core3 {
> > > >                cpu0: cpu@0 {
> > > >                        compatible = "thead,c920", "riscv";
> > > >                        device_type = "cpu";
> > > > -                     riscv,isa = "rv64imafdc";
> > > > +                     riscv,isa = "rv64imafdc_zfh";
> > > Need not touch this. "riscv,isa" is deprecated and replaced by
> > > "riscv,isa-base" & "riscv,isa-extensions".
> > > 
> > > And only adding zfh for this looks a bit werid.
> > > 
> > > Actually, I plan to remove "riscv,isa" later, so please don't touch this
> > > from now on.
> > I think that since the linux kernel is the upstream for devicetree, it
> > cannot yet remove riscv, isa needs to maintain compatibility.
> 
> OK, maybe it's not good to remove "riscv,isa".
> 
> Can this patch not modify "riscv,isa", but only add something for
> "riscv,isa-extensions"?
> 

I can remove this while merging the patch, is it OK for you?

Regards,
Inochi
