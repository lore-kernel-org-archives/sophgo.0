Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A811FAC42
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761699663; cv=none; b=KdsbA9P6CgJTXsoWHuhhhHvw/jWCO7TgKp48Gwl5QmjpaK5jFVp0ZXIOzQJl5aybPx9U9Q5C4lLV+ATL/V11xqH71DxvYWqO/l/XXWxZdLu1QhOUYf841wvBTW21re18EB4M+Wv5NfQcX44KorYhh114jWvlY96neczcd2DGS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761699663; c=relaxed/simple;
	bh=uTnDRKOlvzmL7s/ezFOD6tLmfxhtqIVOOmhIkAE8y/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdTL5VKyZ7MA+Gka3U8nzSjrtDkMGTfRr2K4nDFTigXoRo6XsYniego+jZw3ODnKsixaPXzpxfTaScbRVfB02W/3GZ8zKUfny4783p1PoTLW6Ss5s2Hk1F69xHIwQfx3Bv0Udix1b2Be7IO6vTT/6waT4eQmjIOeFuL4fLDIPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhwphpRc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhwphpRc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a213c3c3f5so8657494b3a.3
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761699661; x=1762304461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOFIBRmcwlFaN9bXxhzQe/4jdraVkcYuslQKkiUSHs4=;
        b=IhwphpRcackrVTHn/nThzy4Gf9YeiDx2L0aRbYUnBYBP7HceJe/AjMz408tuhEtaEX
         53bxr1CtE4ssE+Kw4rQZu+xg/DxeVEEzcgaO8t1/I9ZqF40DacucEwjCzBDKYqXvyGlS
         i/eFbbcwOB+65DlbU8aN8hXVsG8bJBRlA5YtUS+wMHL9+zXE/5tktywGZd8+ez6g4OhI
         O+IZTfViUitZ4namJTu68KYzS/iWCD6ZxEBl8iTq/Ov6qgFnUZEcAIp5kLw1euvk8Nh9
         FPt/uuU9AXiWupQLEJpFxuRf9TFji8YN9gH0bXqiq41Df+EoEVbSO3c5NLLiZGDz55WX
         /fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761699661; x=1762304461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOFIBRmcwlFaN9bXxhzQe/4jdraVkcYuslQKkiUSHs4=;
        b=lCQ/SgiL2ygF2F2LcqJZdHzBybNqyhZvOZFQgRBhDcB3QXeg6rOVtQDDTTq5zdHi86
         RzPva2WhMRlKrkdb6IfvGo5sKSy5Efjx1cbwqkBY0PkDJj//kvFk3V0jcdeoAeWSh6Yr
         TRVnXwkhOgoZjOGapkXx2XPv+X1Fm/2FfrKIv6VNJvY5yQyZfyWVPPq5SzY2GlIKKJuG
         3Ouo8KMWQE8oa/2WPCVVU6HisKDS56TD/WSZtA8nv4mN9DAmpcVKBsZ/2vsQd9b4BpkK
         GvddTliyUv3iQ8pqEBawI7fJleUtszxUU1N3g5jtaTT0HmMt1ZKeZ4prJdZC4fb24fqz
         qFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgw4SlJoEHTTLeqKUmN2m9lQcarnCin9qPVpPllDqNtUuae/tV+FsqQFBaWLxiOUzABU+Y+zw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7E9O+M7GWCf3oPsqXyIAIbgXvanvluJKf707F/xKJS+Ij7FQA
	NLmABFUNQ4wthVbTloUgT3Qk/bmBmu7o26ZSKzHZuO2flz0fLjtqUJM5
X-Gm-Gg: ASbGncs9AB4AXgnpn6xgxmkaZGdxGG1jloHELIY3C75eHoqhElN0u7+bIdropn0YulV
	+rEOUITuXnrtIZrFIWcXQWR+ZZQEAtao0HHJeW/hlIjUn+gt8OVWniWfqAo3x1pSyThLS4NLOAl
	SkWL31nqeyjgNYJXO3IC7N9vrztyxBpvyFT5Ln7egTtyi2cZ9pfwCtwdpgYJ7NgJe8Yfa8b8W3c
	0z1ben7FYYiU1nNSP4GVpjrnJG1IrF8F4VlpjO9EjrM1Pz+kutNy04OM8gpTIz+PgjkN5v7bQKW
	7WW1ThE8f7XViKH/u25HprDIOeBqAPvDSl1MyMMmEW2sk854ibBjeK8qLzRQiurAK0L6JpaZ9kJ
	tt9j11mH344yz5SRk6BbMLx91EslgOmcguP3vklOvqk0BiFdy6zp7YojZLAaxjiG/e/tA+WIyfb
	ND5rCxzMISQg==
X-Google-Smtp-Source: AGHT+IEMe32xqVGqKCj2DGI+hZvdmpFIC/0PTrMJHiFO3ihM2p5pLrA2hxJkIMoSwNxbQFCypenenQ==
X-Received: by 2002:a05:6a20:914a:b0:2f1:302d:1285 with SMTP id adf61e73a8af0-34657f5b873mr1069767637.17.1761699660885;
        Tue, 28 Oct 2025 18:01:00 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414015724sm13039315b3a.14.2025.10.28.18.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 18:01:00 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:00:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, conor+dt@kernel.org, krzk+dt@kernel.org, 
	mani@kernel.org, liujingqi@lanxincomputing.com, palmer@dabbelt.com, 
	pjw@kernel.org, robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
	fengchun.li@sophgo.com
Subject: Re: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
Message-ID: <ilkog5axxgj2vexc2wegkpyyysrrcjhejamnpc2wmb3ilakbwq@f25veozfglr6>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
 <PN6PR01MB1171791524E2BC1C227E342F6FEF5A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
 <CAAT7Ki_4nkKM1-D_8ybwusxTTsR=Lf09v8Cx6QDWfuy8KLtbBg@mail.gmail.com>
 <PN6PR01MB1171739409EDE88BC4453D09AFEFFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN6PR01MB1171739409EDE88BC4453D09AFEFFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>

On Sun, Oct 26, 2025 at 08:31:49AM +0800, Chen Wang wrote:
> 
> On 10/25/2025 7:58 PM, Han Gao wrote:
> [......]
> > > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > EVB1.X/2.0 can be started normally.
> 
> Thank you, Han.
> 
> Inochi, please add "Tested-by: Han Gao <rabenda.cn@gmail.com>" when you pick
> this patchset for next.
> 

Just add the tag is fine and no quote, I can collect the tag with b4.

Like this.

Tested-by: Han Gao <rabenda.cn@gmail.com>

Regards,
Inochi
