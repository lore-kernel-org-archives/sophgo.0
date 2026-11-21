Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304695;
	b=yU33oEPrjY0KO2tHO3YYuxk0n0wFmosKS5aLA/m+Wj2GTOfSprP2HQOOUdUdoGHPii+E
	 5IvN40obSn41j4TIne1tSvGPSevjmn3n8Ubeui8AZ9JQXa3alyX6Bih84R5UIzcHRX7jJ
	 vOJSJOXJvm0IZSb09iUOJjN/nc0hnWK37LvR4dHh3FM4VHIcRF6GR9bhnsM5kxtJ6KW+Y
	 aJ65i/8CPfJwzLhJGiESe0BU76Jw3sTHnyZwnHF8bbfj3mCgnmBD+XwPE9Fdq7SCsMel+
	 K623DXutcf0RNZxpVt3sy1mg59mjZnBy/lfMSCq9c0baoWQQM7vpE3UZmtfOYJBc3DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=euG+RqQvheU6keSPzs75dZgF0gjjXiXQTzRnhsV5zcw=;
	b=wB3YxGu0MA8vJqdGFDwWRggDzWkpSWitySvXS6DMiYGikNmyOnLLaOvugpYI8nxVXdU/
	 FqVlHYJzdbVxD0wDCBgbZqAWOBWuk/VFZ8yw4nWpg/7Q6qOM0D9Efemi03zdMWX/d3Tzc
	 oDTnqNCAJpstudJjMXQKvQOSIF7N4F9KpROLGin7zGS3Cs8CcsGwpfRS1Hl9u1zQQBEpB
	 ylcjlpc5chvdr42ad4nQe0z3K9I9cip5uzuJwnRuFRaYHWTo3EBqzB3VPbFjNAvAFeK7L
	 iW3mW1lwsg+tbxWA/FDThWCnrTvHAUc2GGANcYhEdEewt8wkVynD7XMeZt18xZxfy3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDwfq2kd;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EE2606A332
	for <sophgo@lists.linux.dev>; Sat, 21 Nov 2026 23:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EE2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDwfq2kd
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddc597d062so1261246a12.3
        for <sophgo@lists.linux.dev>; Sat, 21 Nov 2026 15:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795304694; x=1795909494; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=euG+RqQvheU6keSPzs75dZgF0gjjXiXQTzRnhsV5zcw=;
        b=kDwfq2kd5c31LSC5Ww4IjCbyT8mnSdvdeEDS2fmExPscqzm926VdVUmRLsQdQOc9XO
         j0NiWxZafuZXL3jtIk86is5SOsKOMusZwB75ePcCX5/hjP7XqF0hDkmMwyCZmy0e5uO7
         OVwlMyMDjxWkZMyQyPCTNjlfyfUD0tBYGp7ygwxoI0az3l86l4EMBEs95hFEpwQI6iS7
         3mVfAJorTYXTpjMzK0mcHygBH0zKDKt+UjNcp+C9uOx0vT87ejpGs8LFIJhwF5oz+64u
         BhSk+m8PPZ3nVlPwYLAL0K5Lr1FYS7Mib8onLot2ZrgIxBOOfxW/0Lx7Wb8xc4O3ENF9
         TThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795304694; x=1795909494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=euG+RqQvheU6keSPzs75dZgF0gjjXiXQTzRnhsV5zcw=;
        b=kNwMrYV8YDcn/vtosN+4fq1g1Vyu9wSlLZJl7zIaLLoT/1NLxFzWLkTlLomB9bWrfH
         xuZFse7aazgDM59ZGtDRPcYxEuYnMRR6wltJuVoL7SNDX6GmBaLzBwYrA46pzGuoAHuK
         I2fdabpWWMq3PO1uSRVO9++0JH2YYbs00+hdpWtZpbILPahY8cEwEwhpKbYhV3s5gL1S
         Xs/XSsuq587IMOj1YFwsf9D2MkS8vggpvNXYz4Y68zuUVAzLKHlapE7hqwtOd8Oq93wg
         Fnxi3EWEaIfh2Kv8lmKDg6vvU4QiGrSwoKib9WBH7/RGddyHxz7gIf+hHI7nyIEWXSfF
         k6ww==
X-Forwarded-Encrypted: i=1; AL+hErFmRF2+McbYjRI5eFRRwGpHwkt8eZhM2uFXU9+jG/5hpY0y1pC0/DD+VTq3c3r9dOPVFx6U5Xg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+pbrFNZapOoD4Bh/xoV903mjUG4GIFurFboT7O6EN+1ai+hvPk
	2RnDXy+V+rbGjfKIhBC8L22iXIhKGni8LMRn8wY7KqyDUGoO1JTa6ldw
X-Gm-Gg: AZFdTZfVFNuR7J6C71IMIZZB/j6y2TrUV87j3DwH0qlWPpY0bjGu+GanAK3uVF9QY4U
	SusQ9bftuT7rCo1bJgRns0qnejwvkl2c1n21C9TX/swDwIXyNtkNC+uWwV6M1vhQaQBY8FPxqY4
	KxqP6zPyTOEX3DG9kjz0b/rORLb67n09Epj6u7bhwpUY64eDW7gorR0tAfdIZJPn8GeH+lsT7Jo
	xiWLclgKykOXOd4+qyUltsgzg3VpE8ZbuwC0uCqjAZoqx0Za52YYK7jbBJelNAKmv2pCV9PKcV7
	XIGVohvC9uXGIy1jcrvF7uT6+seAW081Zu4hM/tnjHbr5ogKAAoAL4p+Xftm+7k9Fol0IeYDieT
	Pw8JaLDXcAjFMIrmN+Tfslvueeo3y81TLChc728vNw5HO5AOddzSPmYhSrXxtMsaUhvs6s1/XeQ
	q++oUFefBvL3J5L6EuygPgiYqkWwrA8FBXvyomqFoKuqHvFAgX0Nh1Z1RAEXIYxmcT0UVc18Xo+
	JAW+NQnnS0Rc+NNKGlntpd+qwpHY+R23hb3d6bPk/KYJxwqqocl5cvuvrXqiVK0rLMySaiGoF72
	3tufqsTZXVkflQh3JQCQcFEwMSME0zOQRBF+dF5OcPiMjbLu
X-Received: by 2002:a05:6a20:6a08:b0:3f8:f0b1:e7bd with SMTP id adf61e73a8af0-4014d457995mr7749315637.39.1795304694184;
        Sat, 21 Nov 2026 15:44:54 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm3289745b3a.18.2026.11.21.15.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:44:53 -0800 (PST)
Date: Sun, 22 Nov 2026 07:44:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: AnnanLiu <annan.liu.xdu@outlook.com>, Chen Wang <chen.wang@linux.dev>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <awIsvG9xhNFPe1Bj@inochi.infowork>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <20261113124748.339778-1-chenyou910331@gmail.com>
 <av2McZf10FiOKDcZ@inochi.infowork>
 <CAKspUhLiZ8GwfVu5cs3f3nr0uFV=qEFs2r+xP+1CkZ5jT5rp6Q@mail.gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhLiZ8GwfVu5cs3f3nr0uFV=qEFs2r+xP+1CkZ5jT5rp6Q@mail.gmail.com>

On Thu, Nov 19, 2026 at 07:56:56PM +0800, 葉宸佑 wrote:
> On Wed, Nov 18, 2026 at 07:32:50PM +0800, Inochi Amaoto wrote:
> > If you want to take this patch, you need to add all watchdog device
> > instead of the only one for RISC-V. There are three watchdog devices
> > for A53/C906 0/C906 1. IIRC only one can take effect at the same
> > time.
> 
> OK, I will add all three (WDT0-2) to the shared dtsi, so the arm64
> SG2000/SG2002 DTS gets them too.
> 
> Since only one can take effect, should all three be enabled in the
> dtsi, or should they be disabled there and enabled by the board DTS?
> I will check in the TRM how the active one is selected and test each
> of them on the Duo 256M.
> 
> Regards,
> Chen-Yu

All should be disabled, only needed one is enabled.

Regards,
Inochi
