Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524FF44E675
	for <sophgo@lists.linux.dev>; Fri, 28 Aug 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923845; cv=pass; b=BZZprmvCWmU82r040vDCx7anhW2jZBnIFSdmgTwQcduSnSqY0C0J/ZNgUtZZPI04bUa/dY74xP9VxpLFvTr2NbQhmQqNzIqORgWq01w+Zah3phuAtDp0YGfHNz5FBqfxExA5SbRz/ln5xkBBTkxQ75jJKFgcW7m3Q0W4D8Ff0Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923845; c=relaxed/simple;
	bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4ASX46mGI1gLqS+eqPE6g9uNyNSBe86xudW7QQFXAMt/7YkN715c3jekaxpaOUuFkkrIkc8YtnsFbt+9cEVrg6z8cSvyyfFcIj3hfLmXcvhjEALX6PHlqJVnBkcqX+HCCalqcP0Zpim1Awk+YmTey7SycG5mLPCAN+IjdEcI5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRihJCQU; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRihJCQU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4e6868276so124837e87.0
        for <sophgo@lists.linux.dev>; Fri, 28 Aug 2026 06:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923842; cv=none;
        d=google.com; s=arc-20260327;
        b=WhzKMLj5sA47g76qkSnqXctRBSNNfjqtdU2MacVf5DcpoFcllKGttOvmxSfjnMSdgY
         WGl1A2sUp5uq5fKOIOam0LeM/gol89xz/mmn+RZZVhGL/HnSh/9Fz0D37PSfu8gRoEGO
         74gNAmROVPOpKPjC4s6WbrcqW0DO5UCrkHPA5dsU71r4e/yVUMcUrWBWYuBKpZ4F1LFf
         EX6j+vor4sN7m4Ti8uKou2hHrfErGpFuFhZQd25pStpSaB8MgUCZTIUu5QeA1ArX6u6E
         FLSjAyzRSPc9er1AiEMMevhcpCs906LNbOqDhttN86e0rH8HsXRYve8PxOkItu4VXd9X
         uZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        fh=mfinwKWf7jdaAzuxknTnAlezgodsGUgbyzm/4RbJoxU=;
        b=MYrAyekwNSUZqpfgIZAKP0KTtip7HZqYcS8xTxcv2o34+744I021QO4wuw7825tneV
         N1Mi7be1HbottnCBTre1CHa5MUXJGHu6wU/8YpDTUamcizy3fdH9CAy6s7Y0LcyT+psl
         rBz2UVcrklxj9FfFKEat6IHqoUgkjof72XuUCXySNVZvf4c/o42fvN6TWiIlBXfICWiJ
         GOUb9sgP2uhZsU7KfJDh0DZBe0geHrvBBLz/q+1OLlkR1QgxVMl8FoTy0bdoQxLWsafz
         V872cnPxWIKUhX3CK6qG+zB6JTqPLwddiETWnlbwoHj0W3e4d3y0ONhrg0Db597TDaK2
         Qo9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923842; x=1788528642; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=DRihJCQUqxsQmWUUEqrGXiOlputHGVeX7tWVJyIpQpF4XiZLPJbCANzUgddCwJ1L0n
         xjfR7HTa/OYxFBgu/iplDFy8VFAe5qPRLDaKS8k67s62VyR/wsTzaGW8e5HLJVKyNKqo
         L/QRSe4d+0qQjRBq4gH7pJ1PzBbIJfJ/5LFS/x0vQ6C5GZFQ9awTpjcsKi4ZF9TXbYra
         eCR4sRaTTloZuCMlNR5ZaoscR53yvT2deUTqTmXKuza364PadGb0sZsEHlpQxtXj5XDX
         bDMvdmGrYeBFDZAK9QdsjMKr91qDt1PygYM9gjVOThzZGZd5ELZbjC9aWUXvL3FT7Cn/
         yrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923842; x=1788528642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=iCQjgBYjM8by/JPI/cMJCvM+OgQ++o4UYe8uJj81BQtpqKX0Yby0PsDivehLYpVGOg
         0Aa+Wm1XCqPm+t8LPbAiXW5O5YbGHjuxhWatbOhQZJEdQuM8aw9EFDhjVa8f2GLVAXSb
         9fPd16crRIbJ/ktUvEyo0D+S07g6J6aVR3zC4/7k3icr2VM5TQTy9InOKbtMzjvM1mbu
         aTGg1cNjMNV+hYTc2LtWA3feyr8DNylSTopzmNafL/zudOzMbfp0lImQf8qlvEmXP9Fv
         jKlScq1N4+vE3sD+FFbQWCTv4cpNjlS6T4oGVH9ECB9CYK0EwlVZOpr/5BmxwMFzdyeq
         te3A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0qfbO8oWriiFluDHLwAVGTrYFw/mGlqhs/e4y8SmyWUnplY8Tc3v+mBDSYY5yTWdVb7CMtL0=@lists.linux.dev
X-Gm-Message-State: AFuF++nJQIZD0ahJPMsdVf0hc1n0ANzU4JIBnwjA8E1gSY59GixrEbd5
	VuX77yS4BIAPIoaKyqXdDNp+OFlkRuQxpdOHGYiqkZQsdJam/cPQYOxXDK4v3A2hdRw5USXFZlv
	VLpRGF48LQdgMVCe0MLqJBznQp6Lt1ZI=
X-Gm-Gg: AR+sD11BjTHiu35ryfxncfVmF1r7cT7X2/QthIH1c1YsurdW9YXt7KNA+AydXAyswhB
	yhtWFq2gzYuZ4LLKmwhJlQnLWG/gRqoApGmgEK16iv0FYXEU8nwIn3732PMQ4PdVVC5+6bYLpAO
	lzS49YLpDm4mr1dsUAlAnM32c8sFUhwR8Q8GuxHHiQc0EnZLatdDBoDS94tCsq8Ek+h+wY/iUed
	wNQnPjFINvZG0/PFm7/n9gQhEBvB3/PPjQ7SaglNQIQSnB0WeYGK9Ihid7vP8s3Jly0FD0CqpBO
	v+qbs+wET+KoRnOtg5DVydKPBI76+ijTHpyVdBXlZr7WPq77S5pOgNSFX+8KrzaBdMO1myMnk1g
	5gZ6jkm11VCNQUYXanysJOEAkQermgaJpZ7T1qA==
X-Received: by 2002:a05:6512:118a:b0:5b4:4c8a:abc1 with SMTP id
 2adb3069b0e04-5b5e6b35c5emr1180327e87.4.1787923842021; Fri, 28 Aug 2026
 06:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803163427.74445-1-chenyou910331@gmail.com> <aokF9v3orE3nBz4D@inochi.infowork>
In-Reply-To: <aokF9v3orE3nBz4D@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:30:30 +0800
X-Gm-Features: AcwNN1U3qtWfXakKgSZWrBm0x66_gbL--qvyFVM6YD3FiR8B948w7osQE2VTpfk
Message-ID: <CAKspUhKtnmmB3UmfqgXa1Ciq=qaqHCmdTYfYDa_X-4WJSQWmfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Please send this with the same thread of PATCH 1. Otherwise, LGTM
>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Understood -- 2/2 went out as its own thread by mistake. It will be
threaded properly in v2, and I will carry your Reviewed-by over.

Thanks,
Chen-Yu
