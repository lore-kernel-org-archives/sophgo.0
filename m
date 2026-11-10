Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309731;
	b=JtEt1ExnmfItYLYKAQI40skloirEiPmCY6bAcBSxftQs1GKGDjJvS1C3vpSFKeAcoVqc
	 /DRqZ5Kk4CXvx0DIXFoBrTWLl12HckZ2DZcJqLP6ahE/zge3tTYkq4nTD3gYLGQOn1bmb
	 WVDvS0HnqXkTtYD91sX1lTZv7tC2JlOCfztoFcrYxrOzDg1gUNM+AJ9cVExkZhrA0FHgv
	 ispv+zpk9G9AATz97XO86xg8VSLY+ZzuyH2xZJwoLx1ORmOKZQAat6r2WcrMHdwtI7R+i
	 WrcSEi//BRQKT2Dxk+6fb7oV4Q97rRYF16AIWY5uBIeksetwV6kl3Xrvgxme3jgWxLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
	b=MzH3KCXYh2MYLCOdJ3ed5v++s2VcrgiAI2NF/bMidqOauVE/pG0/jMpG51K7CF/6gPTK
	 c/uanHekbyBi13gvysEVe5MI6Gym/z18+1oXkEO+/XH5FKPr4llhKh3yHloYORzjKxFyl
	 ZRLFST5+czf9vD9fn+cSnwj4NXmNy6k7j2ay0h2KXW3stzWrad1CP7XgGqJj3MA5E/mDu
	 Lt+HN945hpGBaFMedhw7dj+npozT523tZMbIgGiCefdTpleO9VPypd0S2zvc5M+QNxzpG
	 9F6AaNXmrUD60oXzI9EM8NDIDPHFETpFER0FKoP9KLMetRubCMk0DBMkbMSJmflBfAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntH4HAkd;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE752606A326
	for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE752606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntH4HAkd
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso737335a12.0
        for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309730; x=1794914530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=ntH4HAkdLDCux13HNdBZJS1a5OsW8gRSHkPdjCh21B3vId6GeGkGEoUMFDu3WfMrLs
         tdxVI/kL2oFdJk9JBxlujuWuhC9ARXVgft+giyIXpcknwvXWZm3hQN1mmLai0Xnk0xji
         h13HKJsPjNWZ8yJKFu+dxd+T1hZTdf9Or4pV9PR3QTlKl+nuvHqx8mdmYgs1JtQHQFyE
         dggzpd4AZT55sl1+rXvfR3OLrkGoyc9RNmiiLwVogAlfXGaBqtUwmD0dpMqnlooVZF6o
         iW1Fwd3dZn4g6Bthon3LJTKEcqWJKYCwWdeLRBrpEisUfUBO2W3S7n/dd3DWC8OGhBQ8
         gGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309730; x=1794914530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=MOqCcGPiyPQNVAR6Mpk5oQDj9gELD2WEm1Pnkmwh+ZZdxxfBbhu9wiBqZzDn7T/oLQ
         6HpN6LyvIbSG1VSeqBU3KB0Qv0n7yYNQnmtqBjH/QJISNe8ymDGZkADydywO8uCJGmi/
         qbDDbMnsTn3ua9FlDZKW9yoeehxiKHJ6sQPzEyos8IKKd1jsjYEMQl2Co8zkOpJpO9/E
         P5rj+NDSkhT62bqm9QTHI2fwvEVI24dvNiV7Q6LD4tv/XvZR2mdsyLluBFnyIbsRisQV
         usi1uMTcJiGjjyIBm892s9xCRNyUtoflVeWZNXnJzeOVkccSd8B4Ax5VnlxUzZWxJlYg
         KEUA==
X-Forwarded-Encrypted: i=1; AL+hErGyVzWbIzV4ZLfHbg8Z4TGRam0oDT7MfVNwmd9uG35LKOG2g3C5jmjp3gcPOS/q3Do2MieeL4M=@lists.linux.dev
X-Gm-Message-State: APuU4Z+6qFqbig0FBPBE3m7v5AcA+eYGK32swZEMHf6rcE7/f1282nzn
	Zf31F0RGeZrkD550IDUTbTpzf9X8UgVQx4fMlA1tPPRqe/wzCvPxVt3z
X-Gm-Gg: AYBFou26tEebM9WfzWa4Alkc2R1Xy8rdbybuAGmabH+tjqIqEk31QL15hzreLJz6TlZ
	fFMek39i2Wg4h4YGRdagEg5M8IEmvEe6GsSPRyPJPhD4LsZuziykAPgNkB8+DdP7NZ/WyY9IPjH
	EEkOB0OXESF3hbY9+FsdIGJjYlFvZ/fCCjKSINdL0BGwfvBawinwJMY0YFQwge3VUEP2Z721E5u
	Z31hbkv0tYZlThlKsLioMYITtYv+yDylBmSSwWHG9iwfiTp9VDbwckHIiDfVTdtSoiXD5OUkeeL
	9Phf/z1gFONl8UTHVeuzfGo52vcw7ZbRXJ1JYQYQksKXEC6xHjuQRUnG0ygDdep0TLRd7xlzwqZ
	oqnIeEhQuQufjwxY6PIoyoOETLEsUHbxbkb7vLXQ5pbKBr6djw1R0Y/jaZN2xcOwxZ7eVTF/Kes
	wHI5jh53QUw70zlUlyzcxDWRJOH3S5DPdsspaBLO67vrzhh8RS4WhAtQ6woqsD6DR69lS9qlaPm
	UVQpU1CUtY4C45yPq6eoBHb7L6wPLyRxsb3NHrVAB75Qftq8VFzR7qSNjfADTzkCYrQ26TACf9j
	zWgrTgmAzvv6Pd41OH5ijP7KkKg=
X-Received: by 2002:a17:90b:1641:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3b166ce8601mr2382151a91.50.1794309729892;
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1c0csm3413913a91.6.2026.11.10.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Date: Tue, 10 Nov 2026 19:21:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Minas Harutyunyan <hminas@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Longbin Li <looong.bin@gmail.com>, 
	Dinh Nguyen <dinguyen@opensource.altera.com>, Paul Zimmerman <paulz@synopsys.com>, Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on
 Huashan PI
Message-ID: <avL-KigWPepz-Z2A@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-5-inochiama@gmail.com>
 <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>

On Tue, Nov 10, 2026 at 11:41:37AM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2026 08:06, Inochi Amaoto wrote:
> > As current the DWC2 support role switch on CV18XX SoCs. Enable it
> > on Huashan PI.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 
> 
> Best regards,
> Krzysztof


Sorry for this mistake, I will spilt them in the next patch. Thanks.

Regards,
Inochi
