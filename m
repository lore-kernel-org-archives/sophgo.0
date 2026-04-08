Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3483815F4
	for <sophgo@lists.linux.dev>; Wed,  8 Apr 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640287; cv=none; b=Bo79P9OWHIr+wnpgFkRFFdeo1H+zrKHzkJxO6VR/UGYB0YShpAwgkuXQTmt5A6fRP2soN6uLmQlx5/gl/xZZy/epiyN+GgjdsZ7hdyQEB2vIujqKy6+v2DGzDnRwYesjDL8lK50/Di5SM3e9rvpiD6IO8OBmmjhM/IhjKqyGzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640287; c=relaxed/simple;
	bh=JpFBtANlHFLqTT9JbgLXyc5p9fBDr1N+c0sFD/XXXzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1w5Vz/tHnk/3yNoWeHosgyfiR032UU5qx/XQEt483pP89xARecXIvm6K5cOVT3iNjzEUX2NG+37LcrNVHECiofJDFUpe5KCKEoX7oTmWxRj9Tg3YNxMjqE1qEqLBgA7VgMB0EsV2EZ68vP9tWkIQu6S5sWdcxWWhGk5DbPxBv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neyEY5iA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neyEY5iA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35c124d2613so3507898a91.2
        for <sophgo@lists.linux.dev>; Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775640284; x=1776245084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGv1dXjup+3rq4irDVbSLxpx15FcV/deE0cr/bXJZ2A=;
        b=neyEY5iAkiz+Syey8/dhOmVllfPCqYM91kh/tuyNvj7EkOc3GbPlMsvtBML7V0tDI8
         bS9r2QtLzCIfjYCcC+/ji8UqxJ85Df5HpxGbM5QLoeUNBTcYb0n6gvZKHRnsDHtKIS0v
         U2UCFbPxFzHyoVe4ZL8fCTD5WNqd0kAzlakhBAVb2I6cQ7YRsQ76359buqETyKdcDGNo
         2LeUf/Z97wqLnH9o9xlLymRzUgOUA/92XuVBobbCZo2S96l+tR3tEM9pphmD3x3mRkfR
         bId0YqsQtbHfB9hQtcTLIzbQvdE9juVq712C0pueg5PV9++Lg+B01E9Izd3lXw5TUQio
         MYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640284; x=1776245084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGv1dXjup+3rq4irDVbSLxpx15FcV/deE0cr/bXJZ2A=;
        b=AbA68cKrF0PfiXc7/ZMM1zYfbXFQC68z51WD4iW6c5r4480odn/jDm66sj8gEHjoec
         78AqLaVx1XaMgc4e0gNm9/qgfI9BBiqfquLvdyLKzEZVhFVIKoHnNq4Wlr6j7FZw++1M
         cf09pFSUR2969PyTDvBzX49fXhzz1QE++emdyRPKpzFiIXwCN21a95f8/7v8gyFHhkg0
         H9aemmhs1+NDnoYGFDgfSQPg8WKauVFJ+lw4dRJa1EUdXlESwuB+f6OqUGKzcgcPg29p
         LX48bxV5pbisrWau3Uvu3CDFzwSmUxnbTzlCKRjjiEbfLkCwqV7a2+XX+21peyVQ1HoG
         sbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5FMe9z7nI5mdXjLh2aqaLovTss34zqcaZJ40JpzTdh8deiW5FrKSj1ixIEZYQLmpAMN+LuNU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5q29uq4K5ECgW4pFAMwgGILCIP/7V8hyxj58oFBfoN+SBp8y+
	8NvJafJHJ5Sy9eueFZbX77r1LVKPJyAl7TWsIpDjmtV9y+6aEqqwxs1V
X-Gm-Gg: AeBDiesKfTgqtPHFVnd+dU0ztwL78Z82Ne0eXFCZ6qKSLkTM3gLanRxhwEdB38SWWc1
	S2o1877xds5OEOqmJpEGIrjhpiGRpBIWeilmqmzas6lLoHTF8jTo3LPwvN3zV7DE9uvOrmQhUhR
	P3ksqkpTTkYHlvtAPvDb6/QPd97YB4iZiyGeRDYCG8RXonzbrKN0fTeTgK8p02BVp+P7xmO26a7
	aBfbtbMz+FOVK2+RtbLcRjAUtObjdV+gbnjP5kaabRQ1DDzJuBs9wvw0zuQXN2f/IY7VmErJ85O
	Wg6b9XKEzHZxdkwRBsKd2mxBoz+5iNTbQlVCNVM6R3ZFwkwV32CjrPVlyGV1UbHWP+vKx3NuFR0
	OASYdEiyJSM9iX0n3q12HkHTZISmHevLL9qf5Kc0xYKaxR8s/hnIvErIr+oFPu2ZouY/FqB/BPu
	+Cxb+wGSyBSdHdtejsKqy5lHo=
X-Received: by 2002:a17:90a:c10f:b0:359:f6f8:57b8 with SMTP id 98e67ed59e1d1-35de67d8a5amr19185815a91.1.1775640284172;
        Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f52c8sm18754408a91.5.2026.04.08.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:43 -0700 (PDT)
Date: Wed, 8 Apr 2026 17:24:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Guodong Xu <guodong@riscstar.com>, Guo Ren <guoren@kernel.org>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit
 address
Message-ID: <adYdiH4Mj5l_Sd_Y@inochi.infowork>
References: <20260406232655.144043-1-inochiama@gmail.com>
 <20260406232655.144043-3-inochiama@gmail.com>
 <20260407-shine-distrust-0546884c2535@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-shine-distrust-0546884c2535@spud>

On Tue, Apr 07, 2026 at 05:31:11PM +0100, Conor Dooley wrote:
> On Tue, Apr 07, 2026 at 07:26:55AM +0800, Inochi Amaoto wrote:
> > Previous the CPU unit address cpu of sg2042 use decimal, it is
> > not following the general convention for unit addresses of the
> > OF. Convent the unit address to hex to resolve this problem.
> > 
> > The introduces a small ABI break for the CPU id, but it should
> > affect nothing since there is no direct full-path reference to
> > these CPU nodes.
> 
> I don't think node names are abi anyway.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hi, Conor,

I do not fully understand this. I agree with that there is no one
use the device node path directly for node reference (especially
for the CPU node), and they prefer to the phandle. But I think it
is a thing that should be persistent, right? May I miss something?

Regards,
Inochi
