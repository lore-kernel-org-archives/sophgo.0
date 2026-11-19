Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089430;
	b=dQLvs0jqiWmjzNiELDcm3Ys1MKBiptYGpOd2A1fgYy2zdKd6rrRhcPWtFu0EqTInN91H
	 5z4YFpgiTiyW7nPGCPKicq3UYEVTdEF0pmj9JfFbdfPHg5MvSvLBDiqMsH9bRrbXE9tgK
	 v/ThbujWvZml8ICWb/TOriut4O4cT2JOAd93K8y6wrhikjsRscIwwZzgnzx77QPAuTF3F
	 HBDigeGlZoPjPQwMDLOCelPc+i1FZ1/QETeoNq6JwXcHy3aNLlVSKSfR9njs5S6Idz7mB
	 YGmEcPwMW+HiwqYHtOLG+W2jXmZFjfmlGv8bKizBecUL2sh+KKTbf6X+nwIGC1Rno6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3DGHJD9OI5RgR3FDLdSkUexvvMBs0ImZw3eBtdXnyLE=;
	b=v6Fim0QK4mG1p3fsk3I8LZiRJSqBfkAG/t7nQcmpObr9Q41Rhc1hITJ/h3GwhpDk6Ubn
	 rX367mPJQ86i0U83UcQc3bc2VY9NnqcVTHYnpdzWBiTf569OkPEkE0kVymz+/ZIWb+Ojx
	 S2bmi1u6TGJuHig5BExuFcY3Tc2+ezXCOeqjrok1lOXi9rtw+WDxJ8kxOMemM//y5BURB
	 JSXJmLulsiTNIroG+8+lqtV3SL+HSZ7FLypEZbRvDbO9Sr4HiJIlvHzLX0TWY/PsfrUKv
	 3+2hcci96c3oP19iM2cjE+wg5tjmEjPhRRUZejZMFnJgZ4LBVsvfqx+cmSZ6rgF3nxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw6WpUGK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3B2606A325
	for <sophgo@lists.linux.dev>; Thu, 19 Nov 2026 11:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3B2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pw6WpUGK
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfb744fa6so2356811fa.2
        for <sophgo@lists.linux.dev>; Thu, 19 Nov 2026 03:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089428; cv=none;
        d=google.com; s=arc-20260327;
        b=h2XzvtdYc4qeT9Ft1RZYbcw90Vsl82bTEExoLEdXwpwYHJYCD3HRjsuyb0Lf7MPeiy
         nzaY1RT1C9ZbrVZxMfIuyY1kjmLoN3TP2NA/kCFOuU6BSilNUb651QHTCJIwxJ28RbRQ
         I4Ff8kMgl40CrdbiooqgiV52fqr88SvY634qMcPLmimJPY2+5t0IWJ7k+rJ7XIFPQ2df
         xf1x3fS8yzR90EsEzY6p/GjIVyFBtRIy0Sl/ecYvu/0h2bnb+kx5a0sldo3EPkgl6KPp
         oBsa6izC+vwBdZ9l6v6tGTDtBGUOKa4eN7H1ydIq7hwBQJpMztU84XeO5qKI2fzckaPy
         xLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3DGHJD9OI5RgR3FDLdSkUexvvMBs0ImZw3eBtdXnyLE=;
        fh=+Fy/+tR5OHdqlmTT2q/W/kGhZ7VC5SZBg/SzjcjfgwA=;
        b=Do90JiQOdhnRuh96JBGQVnb+kgHfcjwCp1cCxL8fsYFs5K4KutQyPYwFnjFUzeZ4Uf
         4dizeKSUUkA/i/2gmsl6plkuGyJrkt+p6kz6xyV2qKGu6q9WKKURB5p7lhYthkrH3ggT
         9G/h3F5mtIEIr21bIgOJEOzBkiCeUVhCquYYOYckY5ZHltdHsDUARhfMjHAddJ++e1fS
         s3sGYKpncIxllv5efPuld3jcrW7ak7pVj8q4OpNRlGH5DApDEpoLmUgnT8mCEGZ4IGe9
         ss1GPqdyzW1ivHALZ+epPM79vpXdQZ3JxknDSuHgIMSvzVa0Ssw7s4cj99OgXJdSjhPN
         XVjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089428; x=1795694228; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DGHJD9OI5RgR3FDLdSkUexvvMBs0ImZw3eBtdXnyLE=;
        b=pw6WpUGKp0XRx03K4pVg6Ma+cMIjqralFV9up5T4gzHb1LRaadZ2gz+47T670XmbOT
         8YGCyu5Z9EVI1Kz5+9kyUSRH51L/vwkkrzMNX8A+LW5sNUsXcuhtYQ77FTQtBiYgOE+b
         Ra+Nz3vuTsiDgzImZanI4TzSsW/Nu3ZAx7taVdlRqQ5xK0Qg0QKF9IEMnZAylUTXjkla
         b8fcekCS0n1w7Ta+r0J68DGmYB/QspsqbnIRo0N6ZcPJ0aLsz23W4CNv9X8GhGw8uLey
         TPPqmlGyuWUhZ3qlY45l5QNOjvmoAffabc8MJRVZ/yFhxuTL0JZ7hHSBzyF3X6adqQsy
         d1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089428; x=1795694228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3DGHJD9OI5RgR3FDLdSkUexvvMBs0ImZw3eBtdXnyLE=;
        b=FlTHK5BoAMBs8olFfKEPiz+bJKhViyMpqV6L3QnAWwxN/57niGzilsbjPdajbkxMwJ
         fJAx6sLMqwlJC5BAGuGuwiu9wSdaAXHJ7pVGwWWzfzaM0q8cXtKgEsR/fMfAXUDR2oh6
         VadG9CAhdoOEKEs7AS6kljS2cWt4zQIW4JnhirtCROwkL5gCXYOhiDf62RDknYPP8/ew
         xtuQL0ffUjsO9KAWPvaEvWQWU4lf5x7Q4BVGsSJXntwPvDu4p5Q14m+QzH6C2BpLYKXs
         HZ54WJvU6BP6WmPTU0ARng9+uPCJfAGKvEpAQVgeZgW0tcJWui42XPXd8NTYlyFixmwo
         oTcA==
X-Forwarded-Encrypted: i=1; AL+hErEB+/0C6j2ffPya6Oq2xt1H051KDaaHtdZYzLv3BUKtm8zu64Jmiuo5mlTAwlrsulVyNHrknQs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9We++mTF62przBKQPnAvlNAHEGcgNxYj+823rGt/HG3WGhUOaH
	R7xSPTwG9XGRXj930PFD/J8y85dJ6dlQGfkzL7+5309U9Z3+hO8DESaLX3dUVYV89FzuUseE6QE
	/91BU5GcT9Dp9ELfdwu5ohWyLydpfl5Q=
X-Gm-Gg: AYBFou38u86Dv5tVlczcBh/iPRKHijsAfyoXF96JR8JTyBMFdcqBqT0+dJ9OfIg8rgq
	jfAPMTN7t++y3qlx08uy2Z/BAwkJ9HwQfR+KJ9idElYeLEd8NT/FUqcxxQA1RamhIzzryyptA9y
	FRDUsB3kMpiG0kwzCWcpfFcQooTad7putGR4rn1Hl9E0S/tX9Hrs3Xjq8Lo33nVg6dPw1/wCSQP
	ldGzkAWuSNFYNyJAUaFRN7s5ss1N+SWXCLI7il4lO39ESBxU+d19pYC/QLXmTbIBf48OYkN9q6C
	0CEAebTOIkuTlwLw3qw/bOeW6BsjN46+EYS7kFFKbNdwr+qFfJoCuvzz8wKE3Ou4e4gNQmPQph0
	cE59TBaEKUQZBBdzTy9v3H7TkHhRAI/qzaQMicYSZ9BzM/moQRVriL5yBA+WXEQot54hFosr8Ek
	yBbr/yN5zO3aTZepCDUo72xPUlI2q3DeWMrbLjDPE=
X-Received: by 2002:a05:6512:2289:b0:5c1:5488:f57d with SMTP id
 2adb3069b0e04-5c1a9d2f33cmr2121143e87.4.1795089427939; Thu, 19 Nov 2026
 03:57:07 -0800 (PST)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <20261113124748.339778-1-chenyou910331@gmail.com> <av2McZf10FiOKDcZ@inochi.infowork>
In-Reply-To: <av2McZf10FiOKDcZ@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:56:56 +0800
X-Gm-Features: Aa3M54qSyoSPK0sbiO1qulApR7twGYkaLmwyVt_kNcR7vSHn3UAf0ux0G1y2ll8
Message-ID: <CAKspUhLiZ8GwfVu5cs3f3nr0uFV=qEFs2r+xP+1CkZ5jT5rp6Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
To: Inochi Amaoto <inochiama@gmail.com>
Cc: AnnanLiu <annan.liu.xdu@outlook.com>, Chen Wang <chen.wang@linux.dev>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 07:32:50PM +0800, Inochi Amaoto wrote:
> If you want to take this patch, you need to add all watchdog device
> instead of the only one for RISC-V. There are three watchdog devices
> for A53/C906 0/C906 1. IIRC only one can take effect at the same
> time.

OK, I will add all three (WDT0-2) to the shared dtsi, so the arm64
SG2000/SG2002 DTS gets them too.

Since only one can take effect, should all three be enabled in the
dtsi, or should they be disabled there and enabled by the board DTS?
I will check in the TRM how the active one is selected and test each
of them on the Duo 256M.

Regards,
Chen-Yu
