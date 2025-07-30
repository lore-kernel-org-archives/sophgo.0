Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5213F1E8326
	for <sophgo@lists.linux.dev>; Wed, 30 Jul 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753855579; cv=none; b=HG2Eok2w5ugBD/e4RTxvs+5mmzLvqU/j+kw2gQX/mGgc9PLrq2H7u+GEdnlV0W810d+Fn7v7C93K1d5fDOcrU/h6SgyvPHS1nBeEsxHkyWpKEcQXchQ5oQiuqxb2EBwx9mWWi4h2yAAY20DInRPZEXCXgj28KZxeMg1OV42FSfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753855579; c=relaxed/simple;
	bh=KvH45e+/9lyZCeYn358sK44xvyOu0g5nN+QuvhM0eik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXhbruTlc1pqVCt7ih0J9mOARm1jI6aBi2mD/R1sWbLkoFY+pVPiMHnvYlX0bweYLCS+6AvlVEH9p3sp/9ps3Yh8qnw9j9hUYobSSHVBAZu0Q8XcDZe/sG6vCqKxDibu7mkJZ8SxEAWRjTD9O7+m92f+Q6CHXb4ILS0HjPgtLmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJtDy7LF; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJtDy7LF"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b391ca6146eso5645430a12.3
        for <sophgo@lists.linux.dev>; Tue, 29 Jul 2025 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753855576; x=1754460376; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RaSd7z98uCro1WOAlKL+w8mLWZF6xQx0RvfWxxYIkg=;
        b=LJtDy7LFcbAILiS/YM8fX1ago7ssGGOFWsE8c40HWNcM6OlSNpuyy9jazmr/jrgYPx
         5rHf3KkI5Gv0eRtr3Sfmmxvo3lfId1ZduOUYxqMBNz4mLHS25j+NqgFDRdqpREGhOrQL
         PWkfjBgjMJ7IVTD1QyuiLr+aMiEnEAaPrwXe7tjT6pDC3CkYLEhoWfHagfw8qWvbKryt
         zfE0v8hnvyU7butG8Qg7/Rbn2yq4BSEqvaxJIAhK3ZxthT6nMwrcBjTfFzZK2KfL/W6q
         01V/F+7AAuY09VI2RaazMArSfeEdM9f4J9TPfA5hL4Wl3BNU0euWtBC6t97pJacT7Utc
         13wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753855576; x=1754460376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RaSd7z98uCro1WOAlKL+w8mLWZF6xQx0RvfWxxYIkg=;
        b=Hh7YhkzUcRBb8ShWCIAyovDmm0tcxhOLt576KacXB42O0B3pe6PNtCKt1kqeZ6XYYv
         0P3gAU271TUlwTotGvIoMPZ69bt++5E9WnyPo1WuIHRe9j78mxMR4vsS18cPqipCZlYL
         nM9eC+or5iBzZTdLj35+yvERjKAFMkQWsZu1f835PsONJHw64kqRpu7YT4NNCQ+LExR6
         FEbjcnweeiEj4VEXBLG6E+YVS+6qbvYwGDZqzHD/L3ECowHBatveqW1VFMV8340VSvuA
         3gXBN+hXYGUp6jXX8PqN0uOwJAaeQRvctAHmDH0uPem/UsA0yGOg80mmtEfacIu6VpAq
         NDYg==
X-Forwarded-Encrypted: i=1; AJvYcCUyTXrttz92MzRluv20igPOMVidyhNg1YjBAX+GjRzxM4qOHnCXWw8uiV6s6D1i1YYygxlU4oE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDikR94/TbV14b85+t2SPrlUeva1IAHSCZbHI8+nunFux3RFPy
	dVMXUGbY0SdgecqIQTBOeA1/zVn4QI7WPD/YiA+9+gqtDDD8lw7w8263
X-Gm-Gg: ASbGncukIK7KnMYax4iUfnRq20UwgD8bioYdPPBw6P2TbCel4BJUlMJfER4i7eUYFBu
	rTN/wvtGWtrJYoqt1QxMNJZ/mc5AQHPOI1yJnjuUyvVUz0wkV6hX+uSzRYMdTK+prGO75s3g0KN
	5hOd6W+/ZpN6vDoi7OS1EYz+1zrGWHn8fz5IUOVEO9KUSHzDkmWm9RLXh5rHJtZrvBYpZD6iCmU
	NtBF96v7JL6zB3a+jZlu2a1DPPUyoC2U/75usSmEchZN0L7PU0HfXtye+YzFhWTXpOgbpvB56yX
	R/spXbUCjg/fnPd+KGMnHx9/1N6HSVQJQwnNxzaPc3QtPHsiwbTDjkJDnTSAiRM+isb3IG3qPrU
	Bgca6K8hqejuUlDV0+35Zn0NdKqf40KQj
X-Google-Smtp-Source: AGHT+IGOb7R6cAkF2XQtdnUrwUvguwI6b0roCbfnnbe1O66LzmjhYar4PM87eH98FGS0Asl/DkAKzA==
X-Received: by 2002:a17:902:e751:b0:220:c164:6ee1 with SMTP id d9443c01a7336-24096ae693cmr31488755ad.32.1753855576452;
        Tue, 29 Jul 2025 23:06:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23fdf58abe0sm83899965ad.145.2025.07.29.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:06:16 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:05:40 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <bfvsmafcsxy4gr4dsprn4z4yl2lltgje2oilsny7vanb7rsolq@t2prbsfisioc>
References: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
 <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>

On Wed, Jul 30, 2025 at 03:57:09AM +0000, Junhui Liu wrote:
> On 29/07/2025 16:31, Inochi Amaoto wrote:
> > On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> >> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> >> processor typically running RTOS.
> >> 
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
> >>  1 file changed, 79 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> @@ -0,0 +1,79 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Sophgo C906L remote processor controller for CV1800B SoC
> >> +
> >> +maintainers:
> >> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> >> +
> >> +description:
> >> +  Document the bindings for the C906L remoteproc component that loads and boots
> >> +  firmwares on the CV1800B SoC.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: sophgo,cv1800b-c906l
> >> +
> >> +  firmware-name:
> >> +    maxItems: 1
> >> +
> >> +  mbox-names:
> >> +    items:
> >> +      - const: tx
> >> +      - const: rx
> >> +
> >> +  mboxes:
> >> +    description:
> >> +      This property is required only if the rpmsg/virtio functionality is used.
> >> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> >> +    items:
> >> +      - description: mailbox channel to send data to C906L
> >> +      - description: mailbox channel to receive data from C906L
> >> +
> >> +  memory-region:
> >> +    description:
> >> +      List of phandles to reserved memory regions used by the remote processor.
> >> +      The first region is required and provides the firmware region for the
> >> +      remote processor. The following regions (vdev buffer, vrings) are optional
> >> +      and are only required if rpmsg/virtio functionality is used.
> >> +    minItems: 1
> >> +    items:
> >> +      - description: firmware region
> >> +      - description: vdev buffer
> >> +      - description: vring0
> >> +      - description: vring1
> >> +    additionalItems: true
> >> +
> > 
> > Why not allocating these region dynamicly? I do not think firware is
> > always avaible before staring. Allowing dynamic firmware give us max
> > flexiblity.
> 
> I'm afraid it's not easy to do this.
> 
> For firmware region, the RTOS firmware usually needs a physical address
> to link to, and I have researched and tested two RTOS (RT-Thread and
> Zephyr) on the C906L, both of them do not support position-independent
> execution or runtime relocation. Therefore, a reserved memory region is
> needed to provide a fixed physical address for the RTOS firmware.

I think it is simple and possible to add PIE support for these RTOS. As
the memory of CV18XX is limited, I do not want to see some reserved
regions. This may hurt users who do not need this.

> (In fact, there is already a reserved memory region for the C906L in
> cv1800b-milkv-duo.dts)

This is just preserved for vendor zsbl and I have a plan to remove it.
Always let linux take care of all memory. It is good to support all
firmware implementation for CV18XX.

I think it is always good to use remoteproc like this:
https://www.kernel.org/doc/html/latest/staging/remoteproc.html

> 
> For virtio-related regions, the RTOS firmware also needs to know the
> shared memory regions for communications at compile time.
> 

I think you should investigate this and check if there is something you
missed. I haven't see any reserved region in remoteproc binding mentions
virtio.

Regards,
Inochi
